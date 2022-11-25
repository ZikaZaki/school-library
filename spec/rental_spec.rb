require './rental'
require './person'
require './book'

describe Rental do
  let(:rental) do
    Rental.new('2021-08-01', Book.new('The Hobbit', 'Agatha Christy'), Person.new(45, name: 'J.R.R. Tolkien'))
  end

  describe '#new' do
    it 'creates a new rental' do
      expect(rental).to be_a(Rental)
    end
  end

  describe '#date' do
    it 'returns the date of the rental' do
      expect(rental.date).to eq('2021-08-01')
    end
  end

  describe '#book' do
    it 'returns the book of the rental' do
      expect(rental.book.title).to eq('The Hobbit')
    end
  end

  describe '#person' do
    it 'returns the person of the rental' do
      expect(rental.person.name).to eq('J.R.R. Tolkien')
    end
  end
end
