require 'json'

module Storage
  def save_file(data, file_name)
    file_path = File.join('storage', file_name)
    json_data = data.map(&:jsonify)
    File.write(file_path, json_data)
  end

  def load_file(file_name, type)
    file_path = File.join('storage', file_name)
    result = []
    return result unless File.exist?(file_path)

    json_data = File.read(file_path)
    data = JSON.parse(json_data)
    load_file_data(data, type)
  end

  private

  def load_file_data(data, type)
    result = []
    data.each do |elem|
      case type
      when 'people'
        result << load_people(elem)
      when 'books'
        result << Book.from_json(elem)
      when 'rentals'
        result << Rentals.from_json(elem)
      end
    end
    result
  end

  def load_people(elem)
    parsed_elem = JSON.parse(elem)
    case parsed_elem['type']
    when 'Teacher'
      Teacher.from_json(parsed_elem)
    when 'Student'
      Student.from_json(parsed_elem)
    end
  end
end
