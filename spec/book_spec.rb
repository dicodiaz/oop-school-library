require 'rspec'
require 'json'
require_relative '../book'

describe Book do
  before(:all) do
    @book_data = {
      id: DateTime.now.strftime('%s').to_i,
      title: 'Dune',
      author: 'Frank Herbert'
    }
  end

  before(:each) do
    @book = Book.new(id: @book_data[:id], title: @book_data[:title], author: @book_data[:author])
  end

  context '#initialize' do
    it 'should initialize with the given id, title, and author' do
      expect(@book).to be_an_instance_of(Book)
      expect(@book.id).to eq(@book_data[:id])
      expect(@book.title).to eq(@book_data[:title])
      expect(@book.author).to eq(@book_data[:author])
    end
  end

  context '#to_json' do
    it 'should return a JSON representation of the object' do
      expected_json = {
        type: @book.class,
        id: @book.id,
        title: @book.title,
        author: @book.author
      }.to_json
      serialized_book = @book.to_json
      expect(serialized_book).to eq(expected_json)
    end
  end

  context '.from_json' do
    it 'should create a new Book object from a JSON' do
      deserialized_serialized_book = Book.from_json(JSON.parse(@book.to_json))
      expect(deserialized_serialized_book.id).to eq(@book.id)
      expect(deserialized_serialized_book.title).to eq(@book.title)
      expect(deserialized_serialized_book.author).to eq(@book.author)
    end
  end

  context '@rentals' do
    it 'should allow accessing and pushing to @rentals' do
      rental = double('rental')
      allow(rental).to receive(:date) { '2023/05/25' }
      @book.rentals << rental
      expect(@book.rentals).to eq([rental])
    end
  end
end
