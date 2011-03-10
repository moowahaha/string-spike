class RegexpSearch
  def initialize words
    @words = "\n" + words.join("\n")
  end

  def search string
    @words.scan(/^(#{string}.*)\n/).flatten
  end
end