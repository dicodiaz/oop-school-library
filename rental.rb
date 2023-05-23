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

  def jsonify
    JSON.dump({
                date: @date,
                book: @book.jsonify,
                person: @person.jsonify
              })
  end

  def self.from_json(str)
    data = JSON.parse(str)
    p data['person']
    new(data['date'], data['book'], data['person'])
    @book.rentals.push(self)
    @person.rentals.push(self)
  end
end
