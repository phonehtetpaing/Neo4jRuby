# frozen_string_literal: true

class Edge
  attr_accessor :from, :to, :weight, :order

  def initialize(from, to, weight, order)
    @from = from
    @to = to
    @weight = weight
    @order = order 
  end

  def <=>(other)
    weight <=> other.weight
  end

  def to_s
    "#{from} => #{to} with weight #{weight}"
  end
end
