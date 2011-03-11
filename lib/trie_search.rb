class TrieSearch
  def initialize data
    @trie = {}

    data.split("\n").each do |line|
      key, value = line.strip.split("=")
      next unless value

      value = JSON.parse(value)

      char_list = ''

      key.split('').each do |char|
        char_list << char
        @trie[char_list] ||= []
        @trie[char_list] << value
      end
    end
  end

  def search string
    (@trie[string] || []).flatten
  end
end