class Account
  attr_reader :account

  def initialize(json)
    #TODO: Handle exceptions
    hash = {}
    keys = json.keys
    array = []
    output_array = Java::Util::ArrayList.new

    output_array.add "Firstname: " + json.getString("first_name")
    output_array.add "Lastname: " + json.getString("last_name")
    output_array.add "Balance: " + json.getString("balance")
    output_array.add "Special Due: " + json.getString("special_due")
    output_array.add "Had: " + json.getString("had")
    output_array.add "Unique: " + json.getString("unique")
    output_array.add "Special Had: " + json.getString("special_had")

    p "finished creating array"

    @account = output_array

  end

  def on_response(activity)
    activity.update_display(self)
  end

end
