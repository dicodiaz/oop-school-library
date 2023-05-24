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
      id: @id,
      title: @title,
      author: @author
    }.to_json
  end

  def self.from_json(data)
    new(id: data['id'], title: data['title'], author: data['author'])
  end
end
