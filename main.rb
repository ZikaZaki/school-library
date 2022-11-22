require_relative 'app'

def main
  app = App.new
  loop do
    puts '-' * 50
    puts "|\tWelcome to School Library App!\t\t |"
    puts '-' * 50
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts 'Please choose an option by entering a number:'
    option = gets.chomp
    option == '7' ? break : app.process_option(option)
  end
  puts 'Thank you for using this app!'
end

main
