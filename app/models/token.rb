class Token
  attr_reader :response

  def initialize(json)
    # p json
    # charset = Com::Android::Volley::Toolbox::HttpHeaderParser.parseCharset(json.headers)
    # p charset
    # s = Java::Lang::String.new("")
    b = byteToString(json.data, Com::Android::Volley::Toolbox::HttpHeaderParser.parseCharset(json.headers))
    # s = Java::Lang::String.new(json.data, "ISO-8859-1") #Com::Android::Volley::Toolbox::HttpHeaderParser.parseCharset(json.headers))
    # Need to use the java override and do this like that instead of in RM
    p b
    @response = "res!"
    # a = Com::Android::Volley::Response.success(json, Com::Android::Volley::Toolbox::HttpHeaderParser.parseCacheHeaders(json))
    # p a.result.result
    # p json.result
  end

  def on_response(activity)
    activity.save_token(self)
  end

end
