class Barcode
  attr_reader :response

  def initialize(json)
    p json.class
  end

  def on_response(activity)
    activity.update_display(self)
  end

end
