require 'json'

module Storage
  def save_file(data, file_name)
    file_path = File.join('storage', file_name)
    File.write(file_path, data.to_json)
  end

  def load_file(file_name, type, books = nil, people = nil)
    file_path = File.join('storage', file_name)
    result = []
    return result unless File.exist?(file_path)

    json_data = File.read(file_path)
    data = JSON.parse(json_data)
    load_file_data(data, type, books, people)
  end

  private

  def load_file_data(data, type, books = nil, people = nil)
    result = []
    data.each do |elem|
      case type
      when 'people'
        result << load_people(elem)
      when 'books'
        result << Book.from_json(elem)
      when 'rentals'
        rental_data = Rental.from_json(elem, books, people)
        result << rental_data unless rental_data.nil?
      end
    end
    result
  end

  def load_people(elem)
    case elem['type']
    when 'Teacher'
      Teacher.from_json(elem)
    when 'Student'
      Student.from_json(elem)
    end
  end
end
