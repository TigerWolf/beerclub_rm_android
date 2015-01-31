private java.util.Map<java.lang.String, java.lang.String> params;
private com.android.volley.Response.Listener<org.json.JSONObject> listener;

public MyPostRequest(int method, java.lang.String url, java.util.Map<java.lang.String, java.lang.String> params,
        com.android.volley.Response.Listener<org.json.JSONObject> reponseListener, com.android.volley.Response.ErrorListener errorListener) {
    super(method, url, errorListener);
    this.listener = reponseListener;
    this.params = params;
}

protected java.util.Map<java.lang.String, java.lang.String> getParams()
        throws com.android.volley.AuthFailureError {
    return params;
};

public com.android.volley.Response.Listener<org.json.JSONObject> getListener() {
  return this.listener;
}

public java.lang.String convertTo64(java.lang.String string) {
  return android.util.Base64.encodeToString(string.getBytes(),  android.util.Base64.NO_WRAP);
}

// @Override
// protected void deliverResponse(org.json.JSONObject response) {
//     // TODO Auto-generated method stub
//     listener.onResponse(response);
// };

// @Override
// protected void deliverResponse(java.lang.Object response) {
//     // TODO Auto-generated method stub
//     // listener.onResponse(response);
// };
