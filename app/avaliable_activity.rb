class AvaliableActivity < Android::App::Activity
  attr_reader :list_array, :username, :password

  def onCreate(savedInstanceState)
    super

    setTitle "Avaliable Beers"

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
    fetch_beers
  end

  def adapter
    array = ["Loading beers...", "Wait for it"]
    @list_array = Java::Util::ArrayList.new array
    simple_list_item_1 = 17367043 # Android::R::Layout::Simple_list_item_1
    Android::Widget::ArrayAdapter.new(self, simple_list_item_1, @list_array)
  end

  def onItemClick(parent, view, position, id)
    p position
    # TODO: Create dialog with ABV%

    # intent = Android::Content::Intent.new(self, WikipediaActivity)
    # intent.putExtra(WikipediaActivity::SelectedState, selected_state)
    # startActivity(intent)
  end

  def fetch_beers
    url = "https://beer.services.adelaide.edu.au/bc/api/account_unique_available/?format=json"
    listener = RequestListener.new(self, BeerList)
    get = MyArrayRequest.new(VolleyMethods::GET, url, nil, listener, nil)
    get.username = @username
    get.password = @password
    p "beers requested"
    request_queue.add(get)
  end

  def request_queue
    @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
  end

  # def update_display(beer_list)
  #   p "update beers"
  #   @list_array = beer_list.beers
  #   # Cannot just update the data - need to change the adapter: http://stackoverflow.com/questions/3200551/unable-to-modify-arrayadapter-in-listview-unsupportedoperationexception
  #   simple_list_item_1 = 17367043 # Android::R::Layout::Simple_list_item_1
  #   @list.adapter = Android::Widget::ArrayAdapter.new(self, simple_list_item_1, @list_array)
  # end

  def update_display(beer_list)
    beer_list = beer_list.beers
    my_hash = Java::Util::HashMap.new
    my_hash.put(Java::Lang::String.new("my_array"), beer_list)
    row_layout = resources.getIdentifier('row_layout', 'layout', packageName)
    @list.adapter = BeerListAdapter.new(self, my_hash)
  end

  def onOptionsItemSelected item
    SharedMenu.new(self).onOptionsItemSelected item
  end

  def onCreateOptionsMenu menu
    SharedMenu.new(self).onCreateOptionsMenu menu
  end


end
