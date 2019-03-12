class CreateBusstop < Neo4j::Migrations::Base
  def up
    add_constraint :Busstop, :uuid
  end

  def down
    drop_constraint :Busstop, :uuid
  end
end
