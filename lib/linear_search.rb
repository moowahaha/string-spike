class LinearSearch
  def initialize data
    @data = {}

    data.split("\n").each do |line|
      key, value = line.strip.split("=")
      @data[key] = JSON.parse(value) if value
    end
  end

  def search string
    matches = []

    re = Regexp.new("^#{string}")

    @data.each do |key, value|
      matches << value if key =~ re
    end

    matches.flatten
  end
end
