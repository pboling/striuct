class Striuct; module Subclassable; module Eigen
  # @group Basic

  # @return [Array<Symbol>]
  def names
    @names.dup
  end

  alias_method :members, :names
  alias_method :keys, :names

  def has_member?(name)
    originalkey_for(keyable_for name)
  rescue Exception
    false
  else
    true
  end
  
  alias_method :member?, :has_member?
  alias_method :has_key?, :has_member?
  alias_method :key?, :has_key?

  # @return [Integer]
  def length
    @names.length
  end
  
  alias_method :size, :length

  # @return [self]
  def freeze
    __stores__.each(&:freeze)
    super
  end

  # @endgroup
end; end; end