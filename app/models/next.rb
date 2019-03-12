class Next
  include Neo4j::ActiveRel
  property :since, type: Integer

  from_class :Sequence
  to_class   :Sequence
  
end
