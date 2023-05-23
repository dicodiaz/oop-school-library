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
    data.each do |elem|
      case type
      when 'people'
        result << Person.from_json(elem)
      end
    end
    result
  end
end
