require 'rspec'
require 'json'
require_relative '../person'

describe Person do
  before(:all) do
    @person_data = {
      id: DateTime.now.strftime('%s').to_i,
      name: 'Peter Parker',
      age: 16,
      parent_permission: false
    }
  end

  before(:each) do
    @person = Person.new(id: @person_data[:id], name: @person_data[:name], age: @person_data[:age],
                         parent_permission: @person_data[:parent_permission])
  end

  context '#initialize' do
    it 'should initialize with the given id, name, age, and parent_permission' do
      expect(@person).to be_an_instance_of(Person)
      expect(@person.id).to eq(@person_data[:id])
      expect(@person.name).to eq(@person_data[:name])
      expect(@person.age).to eq(@person_data[:age])
      expect(@person.parent_permission).to eq(@person_data[:parent_permission])
    end
  end

  context '#can_use_services?' do
    it "returns false when person is not of age and doesn't have parent permission" do
      expect(@person.can_use_services?).to be(false)
    end

    it 'returns true when person is of age' do
      min_of_age = 19
      @person.age = min_of_age
      expect(@person.can_use_services?).to be(true)
    end

    it 'returns true when person has parent permission' do
      @person.parent_permission = true
      expect(@person.can_use_services?).to be(true)
    end
  end

  context '#correct_name' do
    it 'should return name unchanged' do
      correct_name = @person.correct_name
      expect(correct_name).to eq(@person.name)
    end
  end

  context '#to_json' do
    it 'should return a JSON representation of the object' do
      expected_json = {
        type: @person.class,
        id: @person.id,
        name: @person.name,
        age: @person.age,
        parent_permission: @person.parent_permission
      }.to_json
      serialized_person = @person.to_json
      expect(serialized_person).to eq(expected_json)
    end
  end

  context '.from_json' do
    it 'should create a new Person object from a JSON' do
      deserialized_serialized_person = Person.from_json(JSON.parse(@person.to_json))
      expect(deserialized_serialized_person.id).to eq(@person.id)
      expect(deserialized_serialized_person.name).to eq(@person.name)
      expect(deserialized_serialized_person.age).to eq(@person.age)
      expect(deserialized_serialized_person.parent_permission).to eq(@person.parent_permission)
    end
  end

  context '@rentals' do
    it 'should allow accessing and pushing to @rentals' do
      rental = double('rental')
      allow(rental).to receive(:date) { '2023/05/25' }
      @person.rentals << rental
      expect(@person.rentals).to eq([rental])
    end
  end
end
