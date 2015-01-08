class Weather
  attr_reader :observations, :temp, :wind_direction, :wind_speed

  def initialize(json)
    #TODO: Handle exceptions
    # @temp = Java::Lang::String.new
    hash = {}
    keys = json.keys
    array = []
    final_array = ["One"]

    while keys.hasNext
      array << keys.next
    end

    for i in array
        value = json.getJSONObject(i)
        hash[i] = value
        # final_array << value
    end

    @temp = final_array #= hash.toString

  end

end
