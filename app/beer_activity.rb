class BeerActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    layoutId = resources.getIdentifier('activity_beer', 'layout', packageName)
    self.contentView = layoutId
    extras = getIntent.getExtras
    if (extras != nil)
      username = extras.getString("username");
      password = extras.getString("password");
    end
    p username
    p password
    callNetworkProcess
  end

  def callNetworkProcess
    url = "http://www.bom.gov.au/fwo/IDN60901/IDN60901.94768.json"
    listener = RequestListener.new(self)
    get = Com::Android::Volley::Toolbox::JsonObjectRequest.new(VolleyMethods::GET, url, nil, listener, nil)

    request_queue.add(get)
  end

  def request_queue
    @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
  end

end
