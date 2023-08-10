require_relative 'app'
require_relative 'catalog'

def app_options(app, catalog)
  puts 'Please select an option:'
  puts '1. option for books'
  puts '2. option for music'
  puts '3. option for games'
  puts '4. Exit'

  print 'Please select an option:'
  choice = gets.chomp.to_i

  case choice
  when 1
    app.display_options(app)
  when 2
    catalog.start
  when 4
    exit
  end
end

def main
  app = App.new
  app.load_data
  catalog = Music.new
  puts 'Welcome to our catalog app'
  loop do
    app_options(app, catalog)
  end
ensure
  app.save_data
end

main
