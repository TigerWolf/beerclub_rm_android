class BeerList
  attr_reader :beers

  def initialize(json)
    keys = json.keys
    output_array = Java::Util::ArrayList.new
    array = []

    # Not all of the keys are sequencial - hack to get around Ruby and Java incompatibility.
    while keys.hasNext
      array << keys.next
    end

    for i in array
        value = json.get(i)
        hash = Java::Util::HashMap.new
        hash.put("name", value.getString("name"))
        hash.put("brewery", value.getString("brewery"))
        hash.put("special", value.getString("special"))
        hash.put("abv", value.getString("abvp"))
        output_array.add hash
    end

    @beers = output_array

  end
end
