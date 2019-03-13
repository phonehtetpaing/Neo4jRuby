class Next
  include Neo4j::ActiveRel
  property :distance, type: Float

  from_class :Sequence
  to_class   :Sequence
  
end
