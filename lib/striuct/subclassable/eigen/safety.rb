class Striuct; module Subclassable; module Eigen
  # @group Struct+ Safety

  # @return [INFERENCE] specific key of inference checker
  def inference
    INFERENCE
  end

  # @param [Symbol, String] name
  def has_conditions?(name)
    name = originalkey_for(keyable_for name)

    ! @conditions[name].nil?
  end
  
  alias_method :restrict?, :has_conditions?

  # @param [Symbol, String] name
  # @param [Object] value
  # @param [Subclass] context - expect own instance
  # value can set the member space
  def sufficient?(name, value, context=nil)
    name = originalkey_for(keyable_for name)

    if restrict? name
      conditions_for(name).any?{|c|pass? value, c, context}
    else
      true
    end
  end
  
  alias_method :accept?, :sufficient?
  alias_method :valid?, :sufficient?
  
  # @param [Object] name
  # accpeptable the name into own member, under protect level of runtime
  def cname?(name)
    check_safety_naming(keyable_for name){|r|r}
  rescue Exception
    false
  end
  
  def closed?
    __stores__.any?(&:frozen?)
  end

  # @param [Symbol, String] name
  # inference checker is waiting yet
  def inference?(name)
    name = originalkey_for(keyable_for name)

    @inferences.has_key? name
  end

  # @endgroup
end; end; end