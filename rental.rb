class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date: nil, book: nil, person: nil)
    @date = date
    @book = book
    @book.rentals.push(self)
    @person = person
    @person.rentals.push(self)
  end

  def to_json(*_args)
    {
      type: self.class,
      date: @date,
      book_id: @book.id,
      person_id: @person.id
    }.to_json
  end

  def self.from_json(data, books, people)
    relevant_book = books.find { |book| book.id == data['book_id'] }
    relevant_person = people.find { |person| person.id == data['person_id'] }
    return nil if relevant_book.nil? || relevant_person.nil?

    new(date: data['date'], book: relevant_book, person: relevant_person)
  end
end
