require './student'

describe Student do
  let(:student) { Student.new(18, name: 'John', parent_permission: true) }

  describe '#new' do
    it 'creates a new student' do
      expect(student).to be_a(Student)
    end
  end

  describe '#age' do
    it 'returns the age of the student' do
      expect(student.age).to eq(18)
    end
  end

  describe '#name' do
    it 'returns the name of the student' do
      expect(student.name).to eq('John')
    end
  end

  describe '#rentals' do
    it 'returns the rentals of the student' do
      expect(student.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the student is of age' do
      expect(student.can_use_services?).to eq(true)
    end

    it 'returns false if the student is under age and does not have parent permission' do
      student = Student.new(10, name: 'John', parent_permission: false)
      expect(student.can_use_services?).to eq(false)
    end

    it 'returns true if the student is under age but has permission' do
      student = Student.new(10, name: 'John', parent_permission: true)
      expect(student.can_use_services?).to eq(true)
    end
  end
end
