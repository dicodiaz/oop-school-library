require 'date'

class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(id: DateTime.now.strftime('%s').to_i, title: nil, author: nil)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    {
      type: self.class,
      id: @id,
      title: @title,
      author: @author
    }.to_json
  end

  def self.from_json(data, _books, _people)
    new(id: data['id'], title: data['title'], author: data['author'])
  end
end
