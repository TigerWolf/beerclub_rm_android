class ErrorListener
  attr_accessor :activity, :responder

  def initialize(activity, responder)
    @activity = activity
    @responder = responder
  end

  # def onResponse(json)
  #   beer_list = @responder.new(json)
  #   @activity.update_display(beer_list)
  # end

  def onErrorResponse(error)
    p error
  end

  # def getParams
  #   params = {}
  #   params["barcode"] = "barcode"
  #   # params[Java::Lang::String.new("grant_type")] = Java::Lang::String.new("client_credentials")
  #   # params
  # end
end
