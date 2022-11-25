# require_relative '../book'
require './book'

describe Book do
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien') }

  describe '#new' do
    it 'creates a new book' do
      expect(book).to be_a(Book)
    end
  end

  describe '#title' do
    it 'returns the title of the book' do
      expect(book.title).to eq('The Hobbit')
    end
  end

  describe '#author' do
    it 'returns the author of the book' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end
  end

  describe '#rentals' do
    it 'returns the rentals of the book' do
      expect(book.rentals).to eq([])
    end
  end
end
