namespace :db do
  task :import_distance => :environment do
    routes = Route.all
    routes.each do |route|
      busstops = route.sequences.busstop
      distance = []
      for i in (0...busstops.size-1)
        distance << Geocoder::Calculations.distance_between([busstops[i].latitude,busstops[i].longitude],[busstops[i+1].latitude,busstops[i+1].longitude])
      end
      route.sequences.each_with_index do |order, index|
        order.distance = distance[index]
        order.longitude = busstops[index].longitude
        order.latitude = busstops[index].latitude
        order.save
      end
      route.sequences.order(:sequence).each_with_index do |sequence, index|
        unless route.sequences.find_by(sequence: index+2).nil?
          sequence.next_busstop_id = route.sequences.find_by(sequence: index+2).busstop_id
          sequence.save
          s1 = route.sequences.find_by(sequence: index+1)
          s2 = route.sequences.find_by(sequence: index+2)
          Next.create(from_node: s1,  to_node: s2, distance: s2.distance)
        end
      end
    end
  end
end

