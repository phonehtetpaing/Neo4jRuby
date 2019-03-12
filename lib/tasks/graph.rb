# frozen_string_literal: true

class Graph
  attr_accessor :nodes
  attr_accessor :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  def add_edge(from, to, weight, order)
    edges << Edge.new(from, to, weight, order)
  end
end
