class Route 
  include Neo4j::ActiveNode
  
  property :name, type: String
  # has_many :in, :stop_orders, origin: :route
  has_many :out, :sequences, origin: :route
  has_many :out, :busstops, type: :sequence
end
