# frozen_string_literal: true

require 'pp'
require_relative 'graph'
require_relative 'node'
require_relative 'edge'
require_relative 'dijkstra'

graph = Graph.new

graph.add_node(node0 = Node.new('Node #0'))
graph.add_node(node1 = Node.new('Node #1'))
graph.add_node(node2 = Node.new('Node #2'))
graph.add_node(node3 = Node.new('Node #3'))


graph.add_edge(node0, node1, 5)
graph.add_edge(node0, node3, 8)
graph.add_edge(node1, node2, 1)
graph.add_edge(node1, node3, 1)
graph.add_edge(node2, node3, 3)

shortest_path = Dijkstra.new(graph, node0).shortest_path_to(node3)
pp shortest_path.map(&:to_s)
