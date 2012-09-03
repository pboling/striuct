class Striuct; module InstanceMethods

  # @group Validation
  
  # @param [Symbol, String] name
  # @param [Object] value - no argument and use own
  # passed under any condition
  def sufficient?(name, value=self[name])
    autonym = autonym_for name
    return true unless restrict? autonym
    
    _valid? condition_for(autonym), value
  end
  
  alias_method :accept?, :sufficient?
  alias_method :valid?, :sufficient?

  # all members passed under any condition
  def strict?
    each_pair.all?{|autonym, value|sufficient? autonym, value}
  end

  # @endgroup

end; end