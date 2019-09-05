namespace :csv_task do
task team: :environment do
  file_name = 'IDK.csv'
  csv_data = Team.to_csv
  file = File.open(file_name,'w')
  file.puts(csv_data)
  puts csv_data

end

end



