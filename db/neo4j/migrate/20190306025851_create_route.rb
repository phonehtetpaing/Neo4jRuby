class CreateRoute < Neo4j::Migrations::Base
  def up
    add_constraint :Route, :uuid
  end

  def down
    drop_constraint :Route, :uuid
  end
end
