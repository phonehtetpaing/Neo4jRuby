class Busstop 
  include Neo4j::ActiveNode
  property :name, type: String
  property :latitude, type: Float
  property :longitude, type: Float
  # has_many :in, :comments, origin: :post
  has_many :out, :sequences, origin: :busstop
  has_many :out, :routes, type: :sequence

end
