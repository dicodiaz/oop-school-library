require 'rspec'
require 'json'
require_relative '../student'

describe Student do
  before(:all) do
    @student_data = {
      id: DateTime.now.strftime('%s').to_i,
      name: 'Rashed Arman',
      age: 19,
      parent_permission: true
    }
  end

  before(:each) do
    @student = Student.new(id: @student_data[:id], name: @student_data[:name], age: @student_data[:age],
                           parent_permission: @student_data[:parent_permission])
  end

  context 'inheritance' do
    it 'should be a subclass of Person' do
      expect(@student.is_a?(Person)).to be(true)
    end
  end

  context '#initialize' do
    it 'should initialize with the given id, name, age, and parent_permission' do
      expect(@student).to be_an_instance_of(Student)
      expect(@student.id).to eq(@student_data[:id])
      expect(@student.name).to eq(@student_data[:name])
      expect(@student.age).to eq(@student_data[:age])
      expect(@student.parent_permission).to eq(@student_data[:parent_permission])
    end
  end

  context '#play_hooky' do
    it 'should return ¯(ツ)/¯' do
      play_hooky = @student.play_hooky
      expect(play_hooky).to eq('¯(ツ)/¯')
    end
  end

  context '#classroom' do
    before(:each) do
      @classroom = double('classroom')
      allow(@classroom).to receive(:students) { [] }
      @student.classroom = @classroom
    end

    it 'should set classroom to student' do
      expect(@student.classroom).to eq(@classroom)
    end

    it 'should overwrite classroom when it was previously set' do
      classroom2 = double('classroom')
      allow(classroom2).to receive(:students) { [] }
      @student.classroom = classroom2
      expect(@student.classroom).not_to eq(@classroom)
      expect(@student.classroom).to eq(classroom2)
    end
  end

  context '#to_json' do
    it 'should return a JSON representation of the object' do
      expected_json = {
        type: @student.class,
        id: @student.id,
        name: @student.name,
        age: @student.age,
        parent_permission: @student.parent_permission
      }.to_json
      serialized_student = @student.to_json
      expect(serialized_student).to eq(expected_json)
    end
  end

  context '.from_json' do
    it 'should create a new Student object from a JSON' do
      deserialized_serialized_student = Student.from_json(JSON.parse(@student.to_json))
      expect(deserialized_serialized_student.id).to eq(@student.id)
      expect(deserialized_serialized_student.name).to eq(@student.name)
      expect(deserialized_serialized_student.age).to eq(@student.age)
      expect(deserialized_serialized_student.parent_permission).to eq(@student.parent_permission)
    end
  end
end
