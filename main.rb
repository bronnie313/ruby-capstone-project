require_relative 'app'

def app_options(app)
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

  when 4
    exit
  end
end

def main
  app = App.new
  app.load_data
  puts 'Welcome to our catalog app'
  loop do
    app_options(app)
  end
ensure
  app.save_data
end

main
