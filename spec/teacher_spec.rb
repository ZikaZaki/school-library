require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math', name: 'John') }

  describe '#new' do
    it 'creates a new teacher' do
      expect(teacher).to be_a(Teacher)
    end
  end

  describe '#age' do
    it 'returns the age of the teacher' do
      expect(teacher.age).to eq(30)
    end
  end

  describe '#name' do
    it 'returns the name of the teacher' do
      expect(teacher.name).to eq('John')
    end
  end

  describe '#specialization' do
    it 'returns the specialization of the teacher' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#rentals' do
    it 'returns the rentals of the teacher' do
      expect(teacher.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the teacher is of age' do
      expect(teacher.can_use_services?).to eq(true)
    end

    it 'returns true if the teacher is under age' do
      teacher = Teacher.new(10, 'Math', name: 'John')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
