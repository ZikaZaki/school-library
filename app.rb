require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App 
  def initialize
    @people = []
    @books = []
    @rentals = []
    load_data
  end

  def load_data
    File.exist?('./data/books.json') ? 
      @books = JSON.parse(File.read('./data/books.json')).map { |book| Book.new(book['title'], book['author'], id: book['id']) }
      : File.open('./data/books.json', 'w') { |file| file.write(JSON.dump([])) }

    File.exist?('./data/people.json') ?
      @people = JSON.parse(File.read('./data/people.json')).map do |person|
        person['type'] == 'Student' ?
        Student.new(person['age'], id: person['id'], name: person['name'], parent_permission: person['parent_permission'], classroom: person['classroom'])
        : Teacher.new(person['age'], person['specialization'], id: person['id'], name: person['name'])
      end
      : File.open('./data/people.json', 'w') { |file| file.write(JSON.dump([])) }

    File.exist?('./data/rentals.json') ?
      @rentals = JSON.parse(File.read('./data/rentals.json')).map do |rental|
        Rental.new(rental['date'], @books.find { |book| book.id == rental['book']['id'] }, @people.find { |person| person.id == rental['person']['id'] })
      end
      : File.open('./data/rentals.json', 'w') { |file| file.write(JSON.dump([])) }
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, name: name, parent_permission: parent_permission)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name: name)
    puts 'Person created successfully'
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) [#{book.class}] ID: #{book.id}, Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def list_books
    @books.each { |book| puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author}" }
  end

  def list_rentals_for_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, [##{rental.book.id}]-Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end

  def save_data
    @books.size > 0 ?
      File.open('./data/books.json', 'w') { |file| file.write(JSON.dump(@books)) }
      : File.open('./data/books.json', 'w') { |file| file.write(JSON.dump([])) }

    @people.size > 0 ?
      File.open('./data/people.json', 'w') { |file| file.write(JSON.dump(@people)) }
      : File.open('./data/people.json', 'w') { |file| file.write(JSON.dump([])) }

    @rentals.size > 0 ?
      File.open('./data/rentals.json', 'w') { |file| file.write(JSON.dump(@rentals)) }
      : File.open('./data/rentals.json', 'w') { |file| file.write(JSON.dump([])) }
  end

  def process_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_for_person_id
    else
      puts 'That is not a valid input'
    end
  end
end
