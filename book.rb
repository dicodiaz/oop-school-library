class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def jsonify
    JSON.dump({
                title: @title,
                author: @author
              })
  end

  def self.from_json(str)
    data = JSON.parse(str)
    new(data['title'], data['author'])
  end
end
