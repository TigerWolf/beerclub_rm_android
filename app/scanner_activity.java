
public java.lang.String byteToString(byte[] bytearray){
    // java.lang.String output_string = java.util.Arrays.toString(bytearray);
    // java.lang.String output_string = java.util.Arrays.toString(bytearray);UnsupportedEncodingException
  java.lang.String output_string = "";
  try {
    output_string = new java.lang.String(bytearray, "UTF-8");

    } catch (java.io.UnsupportedEncodingException e){
    }
    return output_string;
};
