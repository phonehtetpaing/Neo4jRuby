namespace :db do
  task :dijtest => :environment do
    require_relative 'graph'
    require_relative 'node'
    require_relative 'edge'
    require_relative 'dijkstra'
    require 'pp'
    graph = Graph.new
    stops = Busstop.all

    stops.each do |stop|
      if !stop.name.empty?
        eval("graph.add_node(Node#{stop.id} = Node.new(stop.name))")
      end
    end

    Route.all.each do |route| 
      route.stop_orders.order("stop_order").each do |stop_order|
        if !stop_order.next_busstop_id.nil?
          if !stop_order.distance.nil?
            eval("graph.add_edge(Node#{stop_order.busstop_id}, Node#{stop_order.next_busstop_id}, stop_order.distance, stop_order.stop_order)")
          else
            eval("graph.add_edge(Node#{stop_order.busstop_id}, Node#{stop_order.next_busstop_id}, 0.000, stop_order.stop_order)")
          end
        end
      end
    end

    shortest_path = Dijkstra.new(graph, Node1).shortest_path_to(Node35)
    pp shortest_path.map(&:to_s)
  end
end
