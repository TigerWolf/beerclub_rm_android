public java.lang.StringBuilder byteToString(byte[] bytearray, java.nio.charset.Charset charset){
  // java.lang.String output_string = "";
  java.lang.StringBuilder output_string = new java.lang.StringBuilder(); // = new com.rubymotion.String("");

  try {
    // output_string = new java.lang.String(bytearray, charset);
    // output_string =   java.lang.Byte.toString(bytearray);
    // java.lang.String charset_string = charset.toString();
    // java.lang.String java_string; // = new java.lang.String(""
    // java_string = org.apache.commons.io.IOUtils.toString(bytearray, charset_string);
    // com.rubymotion.String rm_string = new com.rubymotion.String(java_string);
    // // output_string = (com.rubymotion.String) java_string;
    // output_string = rm_string;

    java.lang.StringBuilder buffer = new java.lang.StringBuilder();
    for(int i=0;i < bytearray.length;i++){
      buffer.append(bytearray[i]);
    }
    output_string = buffer; //"abc"; //buffer.toString();

    // Byte.toString(b)
  } catch (java.lang.Exception e){
  }
  return output_string;
};
