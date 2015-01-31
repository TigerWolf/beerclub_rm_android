class RequestListener
  attr_accessor :activity, :responder

  def initialize(activity, responder)
    @activity = activity
    @responder = responder
  end

  def onResponse(json)
    beer_list = @responder.new(json)
    @activity.update_display(beer_list)
  end
end
