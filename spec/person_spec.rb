require './person'

describe Person do
  let(:person) { Person.new(30, name: 'John') }

  describe '#new' do
    it 'creates a new person' do
      expect(person).to be_a(Person)
    end
  end

  describe '#age' do
    it 'returns the age of the person' do
      expect(person.age).to eq(30)
    end
  end

  describe '#name' do
    it 'returns the name of the person' do
      expect(person.name).to eq('John')
    end
  end

  describe '#rentals' do
    it 'returns the rentals of the person' do
      expect(person.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is under age and does not have parent permission' do
      person = Person.new(10, name: 'John', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end
end
