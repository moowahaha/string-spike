class TrieSearch
  def initialize words
    @trie = {}

    words.each do |word|
      char_list = ''
      word.split('').each do |char|
        char_list << char
        @trie[char_list] ||= []
        @trie[char_list] << word
      end
    end
  end

  def search string
    @trie[string]
  end
end