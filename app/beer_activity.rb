class BeerActivity < Android::App::Activity
  attr_reader :list_array, :beer_list, :username, :password

  # TODO: Beers you have already had

  def onCreate(savedInstanceState)
    super

    setTitle "Beer List"

    extras = getIntent.getExtras
    if (extras != nil)
      @username = extras.getString("username");
      @password = extras.getString("password");
    end

    layoutId = resources.getIdentifier('activity_beer', 'layout', packageName)
    self.contentView = layoutId

    @list = findViewById(resources.getIdentifier('listView', 'id', packageName))
    @list.adapter = adapter
    @list.onItemClickListener = self

    # This means beers are no re-downloaded on rotate.
    # TODO: When AndroidManifest support is added, implement feature to stop rotated activity from reloading
    if savedInstanceState != nil
      beer_list =  savedInstanceState.getStringArrayList("beer_list")
      if beer_list != nil
        update_list(beer_list)
      end
    else
      fetch_beers
    end

  end

  def adapter
    array = ["Loading beers...", "Wait for it"]
    list_array = Java::Util::ArrayList.new array
    simple_list_item_1 = 17367043 # Android::R::Layout::Simple_list_item_1
    simple_list_item_2 = 17367044 # Android::R::Layout::Simple_list_item_2
    Android::Widget::ArrayAdapter.new(self, simple_list_item_1, list_array)
  end

  def onItemClick(parent, view, position, id)
    abv =  @list_array[position]["abv"].toString
    alert = AlertHelper.new(self)
    alert.only_ok = true
    alert.dialog("ABV", "The ABV for this beer is: #{abv}" )
  end

  # This needs to be handled.
  def onClick(dialog, which)
  end

  def fetch_beers
    p "fetch beers"
    url = "https://beer.services.adelaide.edu.au/bc/api/beer_list/?format=json"
    success_listener = VolleyMotion::RequestListener.new(self, BeerList)
    error_listener = VolleyMotion::ErrorListener.new(self)
    get = VolleyMotion::JsonArrayAuthRequest.new(url, success_listener, error_listener)
    get.username = @username
    get.password = @password
    request_queue.add(get)
  end

  def request_queue
    @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
  end

  def update_display(beer_list)
    beer_array = beer_list.beers
    update_list(beer_array)
  end

  def update_list(beer_list)
    @list_array = beer_list
    my_hash = Java::Util::HashMap.new
    my_hash.put("my_array", beer_list)
    row_layout = resources.getIdentifier('row_layout', 'layout', packageName)
    @list.adapter = BeerListAdapter.new(self, my_hash)
  end

  def onSaveInstanceState(savedInstanceState)
    super
    # Save the user's current beer list state
    savedInstanceState.putStringArrayList("beer_list", @list_array)
  end

  def onOptionsItemSelected item
    SharedMenu.new(self).onOptionsItemSelected item
  end

  def onCreateOptionsMenu menu
    SharedMenu.new(self).onCreateOptionsMenu menu
  end

end
