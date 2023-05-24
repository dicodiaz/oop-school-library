class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rentals.push(self)
    @person = person
    @person.rentals.push(self)
  end

  def to_json(*_args)
    {
      date: @date,
      book_id: @book.id,
      person_id: @person.id
    }.to_json
  end

  def self.from_json(rental_data, books, people)
    relevant_book = books.find do { |book| book.id == rental_data['book_id'] }
    relevant_person = people.find { |person| person.id == rental_data['person_id'] }
    return nil if relevant_book.nil? || relevant_person.nil?

    new(rental_data['date'], relevant_book, relevant_person)
  end
end
