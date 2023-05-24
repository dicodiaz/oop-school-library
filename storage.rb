require 'json'

TYPE_HASH = { 'Person' => Person, 'Student' => Student, 'Teacher' => Teacher, 'Book' => Book,
              'Rental' => Rental }.freeze

module Storage
  def save_file(data, file_name)
    file_path = File.join('storage', file_name)
    File.write(file_path, data.to_json)
  end

  def load_file(file_name, books = nil, people = nil)
    file_path = File.join('storage', file_name)
    return [] unless File.exist?(file_path)

    json_data = File.read(file_path)
    data = JSON.parse(json_data)
    data.map { |elem| TYPE_HASH[elem['type']].from_json(elem, books, people) }
  end
end
