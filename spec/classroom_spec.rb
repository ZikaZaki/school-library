require './classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Mathematics') }

  describe '#new' do
    it 'creates a new classroom' do
      expect(classroom).to be_a(Classroom)
    end
  end

  describe '#label' do
    it 'returns the label of the classroom' do
      expect(classroom.label).to eq('Mathematics')
    end
  end

  describe '#students' do
    it 'returns the students of the classroom' do
      expect(classroom.students).to eq([])
    end
  end
end
