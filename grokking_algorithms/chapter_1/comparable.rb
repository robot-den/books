# frozen_string_literal: true

class A
  include Comparable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def <=>(other)
    name.size <=> other.name.size
  end
end

a1 = A.new('david')
a2 = A.new('john')

puts a1 > a2