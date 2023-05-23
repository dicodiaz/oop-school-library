module Storage
  def save_file(data, file_name)
    file_path = File.join('storage', file_name)
    json_data = data.map(&:jsonify)
    File.write(file_path, json_data)
  end
end
