class MyArrayRequest < Com::Android::Volley::Toolbox::JsonObjectRequest

  def getHeaders
    # headers = Java::Util::Map.new
    headers = {}
    string = Java::Lang::String.new("Basic YmN0ZXN0OkZ1Y2tZZWFoQmVlcg==")
    authorization = Java::Lang::String.new("Authorization")
    # encoded = string.getBytes
    # auth = "Basic " + Android::Util::Base64.encodeToString(encoded, Android::Util::Base64.NO_WRAP);
    # auth = "Basic "
    headers[authorization] = string #auth
    headers
  end

  # def getParams
  #   params = {}
  #   params[Java::Lang::String.new("grant_type")] = Java::Lang::String.new("client_credentials")
  #   params
  # end

end

=begin
package com.myapp.services;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;

import android.util.Base64;

import com.android.volley.AuthFailureError;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.JsonArrayRequest;

public class MyArrayRequest extends JsonArrayRequest{

  public MyArrayRequest(String url, JSONArray jsonRequest,
      Listener<JSONArray> listener, ErrorListener errorListener) {
    super(url, listener, errorListener);
  }

  public MyArrayRequest(String url, Response.Listener<JSONArray> listener,
            Response.ErrorListener errorListener, String username, String password) {
    super(url, listener, errorListener);
    if (username != null && password != null) {
      String loginEncoded = new String(Base64.encode((username + ":" + password).getBytes(), Base64.NO_WRAP));
      this.headers.put("Authorization", "Basic " + loginEncoded);
    }
  }

  private Map<String, String> headers = new HashMap<String, String>();
    @Override
    public Map<String, String> getHeaders() throws AuthFailureError {
      return headers;
  }

  public void setHeader(String title, String content) {
    headers.put(title, content);
  }
}
=end
