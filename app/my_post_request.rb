class MyPostRequest < Com::Android::Volley::Request #::JsonObjectRequest

  def getHeaders
    headers = {}
    auth_string = @username + ":" + @password
    auth = "Basic " + convertTo64(auth_string)
    auth = Java::Lang::String.new(auth)
    headers[Java::Lang::String.new("Authorization")] = auth
    headers
  end

  def username=(username)
    @username = username
  end

  def password=(password)
    @password = password
  end

  def parseNetworkResponse(response)
    p "parseNetworkResponse"
    jsonString = response.data
    p jsonString.toString
    return Com::Android::Volley::Response.success(jsonString, Com::Android::Volley::Toolbox::HttpHeaderParser.parseCacheHeaders(response))
  end

  # def getParams
  #   params = {}
  #   params["barcode"] = "barcode"
  #   # params[Java::Lang::String.new("grant_type")] = Java::Lang::String.new("client_credentials")
  #   # params
  # end

  def deliverResponse(response)
    # p response
    p "deliverResponse"
    listener = getListener
    listener.onResponse(response)
  end

end
