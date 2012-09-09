class Striuct; module ClassMethods

  # @group Adjuster
  
  # @param [Symbol, String] name
  def has_adjuster?(name)
    autonym = autonym_for_name name

    _attributes_for(autonym).has_adjuster?
  end

  alias_method :has_flavor?, :has_adjuster? # obsolute
  
  # @param [Symbol, String] name
  def adjuster_for(name)
    return nil unless has_adjuster? name
    autonym = autonym_for_name name
    
    _attributes_for(autonym).adjuster
  end
  
  alias_method :flavor_for, :adjuster_for # obsolute

  # @endgroup

end; end
