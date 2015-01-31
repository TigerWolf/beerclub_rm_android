class MyPostSuccess < Com::Android::Volley::Toolbox::JsonObjectRequest

  def getHeaders
    # headers = Java::Util::Map.new
    headers = {}
    string = Java::Lang::String.new("Basic YmN0ZXN0OkZ1Y2tZZWFoQmVlcg==")
    authorization = Java::Lang::String.new("Authorization")

    username = Java::Lang::String.new("username")

    # encoded = string.getBytes
    # auth = "Basic " + Android::Util::Base64.encodeToString(encoded, Android::Util::Base64.NO_WRAP);
    # auth = "Basic "
    headers[authorization] = string #auth
    headers
  end

  # def getParams
  #   params = {}
  #   params["barcode"] = "barcode"
  #   # params[Java::Lang::String.new("grant_type")] = Java::Lang::String.new("client_credentials")
  #   # params
  # end

end
