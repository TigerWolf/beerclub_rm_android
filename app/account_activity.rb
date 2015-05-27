class AccountActivity < Android::App::Activity
  attr_reader :list_array, :username, :password

  def onCreate(savedInstanceState)
    super

    setTitle("Your Account")

    extras = getIntent.getExtras
    if (extras != nil)
      @username = extras.getString("username");
      @password = extras.getString("password");
    end

    layoutId = resources.getIdentifier('activity_account', 'layout', packageName)
    self.contentView = layoutId

    @list = findViewById(resources.getIdentifier('listView', 'id', packageName))
    @list.adapter = adapter
    @list.onItemClickListener = self
    fetch_beers
  end

  def adapter
    array = ["Loading account...", "Wait for it"]
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
    url = "https://beer.services.adelaide.edu.au/bc/api/account/?format=json"
    success_listener = VolleyMotion::RequestListener.new(self, Account)
    error_listener = VolleyMotion::ErrorListener.new(self)
    get = VolleyMotion::JsonObjectAuthRequest.new(url, success_listener, error_listener)
    get.username = @username
    get.password = @password
    p "beers requested"
    request_queue.add(get)
  end

  def request_queue
    @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
  end

  def update_display(beer_list)
    p "update beers"
    @list_array = beer_list.account
    # Cannot just update the data - need to change the adapter: http://stackoverflow.com/questions/3200551/unable-to-modify-arrayadapter-in-listview-unsupportedoperationexception
    simple_list_item_1 = 17367043 # Android::R::Layout::Simple_list_item_1
    @list.adapter = Android::Widget::ArrayAdapter.new(self, simple_list_item_1, @list_array)
  end

  def error_response(res)
      alert = AlertHelper.new(self, AlertResponse.new)
      alert.only_ok = true
      alert.dialog("Error", "There was an error connecting to the server. " +  res[:message])
  end

  def onOptionsItemSelected item
    SharedMenu.new(self).onOptionsItemSelected item
  end

  def onCreateOptionsMenu menu
    SharedMenu.new(self).onCreateOptionsMenu menu
  end

end
