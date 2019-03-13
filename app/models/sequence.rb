class Sequence 
  include Neo4j::ActiveNode
  property :sequence, type: Integer
  property :distance, type: Float
  property :next_busstop_id, type: String
  property :latitude, type: Float
  property :longitude, type: Float

  has_one :in, :busstop, type: :busstop
  has_one :in, :route, type: :route
  has_many :out, :sequences, rel_class: :Next

end
