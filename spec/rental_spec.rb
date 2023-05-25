require 'rspec'
require 'json'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @person1 = Person.new(name: 'Jhin', age: 44)
    @book1 = Book.new(title: 'Project Hail Mary', author: 'Andy Weir')

    @date = '2023/05/25'
    @rental = Rental.new(date: @date, book: @book1, person: @person1)
  end

  context '#initialize' do
    it 'should initialize with the given date, book and person' do
      rental = Rental.new(date: @date, book: @book1, person: @person1)
      expect(rental.date).to eq(@date)
      expect(rental.book).to eq(@book1)
      expect(rental.person).to eq(@person1)
    end

    it 'should add the rental to the book and person' do
      expect(@book1.rentals).to include(@rental)
      expect(@person1.rentals).to include(@rental)
    end
  end

  context '#to_json' do
    it 'should return JSON represantation of the object' do
      expected_json = { type: @rental.class,
                        date: @rental.date,
                        book_id: @rental.book.id,
                        person_id: @rental.person.id }
      expect(@rental.to_json).to eq(expected_json.to_json)
    end
  end

  describe '.from_json' do
    context 'when the book and person are found' do
      it 'should create a Rental object from JSON' do
        rental = Rental.from_json(JSON.parse(@rental.to_json), [@book1], [@person1])

        expect(rental).to be_an_instance_of(Rental)
        expect(rental.date).to eq(@rental.date)
        expect(rental.book).to eq(@rental.book)
        expect(rental.person).to eq(@rental.person)

        expect(@book1.rentals).to include(rental)
        expect(@person1.rentals).to include(rental)
      end
    end

    context 'when the book or person is not found' do
      it 'should return nil' do
        @non_existent_book = Book.new(id: 0, title: 'Non existent book', author: 'Non existent author')
        rental = Rental.from_json(JSON.parse(@rental.to_json), [@non_existent_book], [@person1])
        expect(rental).to be_nil
      end
      it 'should return nil' do
        @non_existent_person = Person.new(id: 0, name: 'Non existent person', age: 42)
        rental = Rental.from_json(JSON.parse(@rental.to_json), [@book1], [@non_existent_person])
        expect(rental).to be_nil
      end
    end
  end
end
