require 'ferret'

class FerretSearch
  include Ferret

  def initialize words
    @index = Index::Index.new()

    words.each do |word|
      @index << {:word => word}
    end
  end

  def search string
    results = []

    @index.search_each("#{string}*") do |id, score|
      results << @index[id][:word]
    end

    results
  end
end