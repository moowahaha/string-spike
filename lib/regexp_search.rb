class RegexpSearch
  def initialize data
    @data = data
  end

  def search string
    @data.scan(/^#{string}.*=(.+)\n/).flatten.map do |result|
      JSON.parse(result)
    end
  end
end