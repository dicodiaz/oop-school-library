require 'date'

class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(title, author, id = DateTime.now.strftime('%s'))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      author: @author
    }.to_json
  end

  def self.from_json(data)
    new(data['title'], data['author'], data['id'])
  end
end
