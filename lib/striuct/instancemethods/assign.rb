require_relative 'subscript'

class Striuct; module InstanceMethods 

  # @group Assign
  
  alias_method :assign, :[]=
  
  # @param [Symbol, String] name
  def assign?(name)
    autonym = autonym_for name
    
    @db.has_key? autonym
  end
  
  # @param [Symbol, String, Fixnum] key
  def clear_at(key)
    __subscript__(key){|autonym|__clear__ autonym}
  end
  
  alias_method :unassign, :clear_at
  alias_method :reset_at, :clear_at

  # all members aren't assigned
  def empty?
    autonyms.none?{|autonym|assign? autonym}
  end

  # @endgroup

end; end