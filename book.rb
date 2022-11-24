require_relative 'rental'

class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(title, author, id: Random.rand(1..1000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args) # this is the same as calling JSON.dump
  end
end
