require 'keyvalidatable'

class Striuct; module ClassMethods

  # @group Constructor
  
  # @return [Striuct]
  def for_values(*values)
    new_instance(*values)
  end

  alias_method :new, :for_values

  # @param [Hash, Struct, Striuct, #each_pair] pairs
  # @return [Striuct]
  def for_pairs(pairs)
    raise TypeError, 'no pairs object' unless pairs.respond_to?(:each_pair)

    keys = KeyValidatable.__send__ :keys_for, pairs
    KeyValidatable.validate_array keys.map(&:to_sym), let: all_members

    new.tap {|instance|
      pairs.each_pair do |name, value|
        instance[name] = value
      end
    }
  end

  alias_method :[], :for_pairs

  # for build the fixed object
  # @param [Hash] options
  # @option options [Boolean] :lock
  # @option options [Boolean] :strict
  # @yieldparam [Striuct] instance
  # @yieldreturn [Striuct] instance
  # @return [void]
  def define(options={lock: true, strict: true})
    raise ArgumentError, 'must with block' unless block_given?
    KeyValidatable.validate_keys options, let: [:lock, :strict]
    
    lock, strict = options[:lock], options[:strict]
    
    new.tap {|instance|
      yield instance
  
      unless (yets = autonyms.select{|autonym|! instance.assign?(autonym)}).empty?
        raise "not assigned members are, yet '#{yets.inspect} in #{self}'"
      end
      
      if strict &&
        ! (invalids = autonyms.select{|autonym|! instance.valid?(autonym)}).empty?

        raise Validation::InvalidWritingError, "invalids members are, yet '#{invalids.inspect} in #{self}'"
      end

      instance.lock_all if lock
    }
  end

  # @endgroup

end; end