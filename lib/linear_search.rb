class LinearSearch
  def initialize words
    @words = words
  end

  def search string
    matches = []

    @words.map do |word|
      matches << word if word.include?(string)
    end

    matches
  end
end