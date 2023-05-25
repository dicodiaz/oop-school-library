require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @student1 = Student.new(name: 'Jhin', age: 44)
    @classroom_label = 'Computer science'
    @classroom = Classroom.new(@classroom_label)
  end

  context '#initialize' do
    it 'should initialize with the given label and emtpy student list' do
      expect(@classroom.label).to eq(@classroom_label)
      expect(@classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    context 'when adding a new students' do
      it 'should add the student to the classroom' do
        @classroom.add_student(@student1)
        expect(@classroom.students).to include(@student1)
      end
    end

    context 'when adding an existing student' do
      before do
        @classroom.add_student(@student1)
      end

      it 'should not add the student to the classroom' do
        expect { @classroom.add_student(@student1) }.not_to(change { @classroom.students.count })
      end
    end
  end
end
