require 'ferret'

class FerretSearch
  include Ferret

  def initialize data
    @index = Index::Index.new()

    data.split("\n").each do |line|
      key, value = line.strip.split("=")
      @index << {:key => key, :value => value} if value
    end
  end

  def search string
    results = []

    @index.search_each("key: #{string}*") do |id, score|
      results << JSON.parse(@index[id][:value])
    end

    results.flatten
  end
end