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
    # fetch_beers
    get_token
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

  def get_token
    url = "https://beer.services.adelaide.edu.au/o/token/"
    success_listener = VolleyMotion::RequestListener.new(self, Token)
    error_listener = VolleyMotion::ErrorListener.new(self)

    client_id = "M=B;vpY=6!qypBBl0qYaRf2;e9ROWqq3?v3KF0iq"
    client_secret = "BgRZgZnCz0QYE=P8a2t1R-6d6RGb=qFcwZOsNKSI;ZDA!5ZPCfZdo5-09!iDFX2cnG1Jr?yEPyMUAa3-rJ_oexj?W5?-R8?hrR67=.Zf7PC0vK;95g!Li:BZMTMzv:nK"

    params = {}
    params[Java::Lang::String.new("grant_type")] = Java::Lang::String.new("password")
    params[Java::Lang::String.new("username")] = Java::Lang::String.new(@username)
    params[Java::Lang::String.new("password")] = Java::Lang::String.new(@password)
    params[Java::Lang::String.new("client_id")] = Java::Lang::String.new(client_id)
    params[Java::Lang::String.new("client_secret")] = Java::Lang::String.new(client_secret)

    # params[Java::Lang::String.new("client_id")] = Java::Lang::String.new("M=B;vpY=6!qypBBl0qYaRf2;e9ROWqq3?v3KF0iq")

    post = VolleyMotion::PostRequest.new(url, params, success_listener, error_listener)
    # post.username = client_id
    # post.password = client_secret
    request_queue.add(post)
  end

  def save_token(object)
      alert = AlertHelper.new(self, AlertResponse.new)
      alert.only_ok = true
      alert.dialog("Submitted", "Your beer has been logged with the server." )
  end

  def fetch_beers
    url = "https://beer.services.adelaide.edu.au/bc/api/account_unique_available/?format=json"
    success_listener = VolleyMotion::RequestListener.new(self, BeerList)
    error_listener = VolleyMotion::ErrorListener.new(self)
    get = VolleyMotion::JsonArrayAuthRequest.new(url, success_listener, error_listener)
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

  def error_response(res)

  end

  def onOptionsItemSelected item
    SharedMenu.new(self).onOptionsItemSelected item
  end

  def onCreateOptionsMenu menu
    SharedMenu.new(self).onCreateOptionsMenu menu
  end


end
