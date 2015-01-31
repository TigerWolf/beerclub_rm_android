
private android.content.Context context = null; // Cant be final - not sure why it complains about it not being initialised.
private java.util.HashMap hash = null;

public BeerListAdapter(android.content.Context context, java.util.HashMap hash) {
  super();
  this.context = context;
  this.hash = hash;
}

public android.content.Context getContext() {
  return this.context;
}

public java.util.HashMap getHash() {
  return this.hash;
}
