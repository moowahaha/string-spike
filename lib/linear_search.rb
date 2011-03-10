class LinearSearch
  def initialize words
    @words = words
  end

  def search string
    matches = []

    re = Regexp.new("^#{string}")

    @words.map do |word|
      matches << word if word =~ re
    end

    matches
  end
end
