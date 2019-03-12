require 'csv'
namespace :db do
  task :import_tsv => :environment do
    Dir["busstops/*.tsv"].sort.each do |i|
      parsed_file = CSV.read(i, {:headers => true, :col_sep=> "\t" })
      # unique = []
      parsed_file.each.with_index(1) do |row , index| 
        # arrays = [row['svc_name']]
        # arrays.each do |x|
        #   if unique.exclude?(x)
        #     unique.push(x)
        #     Route.create!(name: row['svc_name'])
        #   end
        # end
        # Busstop.find_or_create_by(name: row['name_en'],latitude: row['lat'], longitude: row['lng'])
        Sequence.create!(sequence: row['sequence'], route: Route.find_by(name: row['svc_name']), busstop: Busstop.find_by(name: row['name_en']))
      end
    end
  end
end 
