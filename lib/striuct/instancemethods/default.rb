class Striuct; module InstanceMethods 

  # @group Default Value
  
  # @param [Symbol, String] name
  def default?(name)
    autonym = autonym_for name

    default_for(autonym) == self[autonym]
  end

  # @endgroup

end; end