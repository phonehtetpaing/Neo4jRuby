namespace :db do
  task :hello => :environment do
    query = "MATCH (start:Busstop{name:'sample stop1'}),(end:Busstop{name:'sample stop3'}) CALL algo.shortestPath.astar.stream(start, end, 'distance', 'latitude', 'longitude', {defaultValue:1.0}) YIELD nodeId RETURN algo.getNodeById(nodeId).name as station"
     result = Neo4j::ActiveBase.current_session.query(query).to_a
     p result
  end
end

