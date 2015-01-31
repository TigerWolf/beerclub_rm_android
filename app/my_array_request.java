public java.lang.String convertTo64(java.lang.String string) {
  return android.util.Base64.encodeToString(string.getBytes(),  android.util.Base64.NO_WRAP);
}
