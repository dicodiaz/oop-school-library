require 'rspec'
require 'json'
require_relative '../teacher'

describe Teacher do
  before :all do
    @teacher_data = {
      id: DateTime.now.strftime('%s').to_i,
      name: 'Dico Diaz',
      age: 31,
      specialization: 'Computer science'
    }
  end

  before :each do
    @teacher = Teacher.new(id: @teacher_data[:id], name: @teacher_data[:name], age: @teacher_data[:age],
                           specialization: @teacher_data[:specialization])
  end

  context '#initialize' do
    it 'should initialize with the given id, name, age and specialization' do
      expect(@teacher).to be_an_instance_of(Teacher)
      expect(@teacher.id).to eq(@teacher_data[:id])
      expect(@teacher.name).to eq(@teacher_data[:name])
      expect(@teacher.age).to eq(@teacher_data[:age])
      expect(@teacher.specialization).to eq(@teacher_data[:specialization])
    end
  end

  context '#can_use_services?' do
    it 'returns true for a teacher' do
      expect(@teacher.can_use_services?).to be(true)
    end
  end

  context '#to_json' do
    it 'should return a JSON representation of the object' do
      expected_json = {
        type: @teacher.class,
        id: @teacher.id,
        specialization: @teacher.specialization,
        age: @teacher.age,
        name: @teacher.name
      }
      expect(@teacher.to_json).to eq(expected_json.to_json)
    end
  end

  context '.from_json' do
    it 'should create a new Teacher object from a JSON' do
      teacher = Teacher.from_json(JSON.parse(@teacher.to_json))
      expect(teacher.id).to eq(@teacher.id)
      expect(teacher.name).to eq(@teacher.name)
      expect(teacher.age).to eq(@teacher.age)
      expect(teacher.specialization).to eq(@teacher.specialization)
    end
  end
end
