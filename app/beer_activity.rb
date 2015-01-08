class BeerActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    extras = getIntent.getExtras
    if (extras != nil)
      username = extras.getString("username");
      password = extras.getString("password");
    end

    layout = Android::Widget::LinearLayout.new(self)
    layout.orientation = Android::Widget::LinearLayout::VERTICAL
    layout.backgroundColor = Android::Graphics::Color.parseColor("#0099CC")

    @temperature_label = new_text_label
    @wind_direction_label = new_text_label
    @wind_speed_label = new_text_label

    @debug_stuff = new_text_label

    layout.addView(@temperature_label)
    layout.addView(@wind_direction_label)
    layout.addView(@wind_speed_label)

    layout.addView(@debug_stuff)

    @beer_list = Android::Widget::ListView.new(self)

    # @beer_list.onItemClickListener = self
    # self.contentView = list

    layout.addView(@beer_list)

    @debug_stuff.text = "#{username} #{password}"

    fetch_beers

    self.contentView = layout
  end

  def fetch_beers
    # url = "http://www.bom.gov.au/fwo/IDN60901/IDN60901.94768.json"
    url = "https://beer.services.adelaide.edu.au/bc/api/beer_list/?format=json"
    # request = ""
    listener = RequestListener.new(self)
    # get = Com::Android::Volley::Toolbox::JsonObjectRequest.new(VolleyMethods::GET, url, nil, listener, nil)
    get = MyArrayRequest.new(VolleyMethods::GET, url, nil, listener, nil)

    request_queue.add(get)
  end

  def update_display(weather)
    # update_display
    # ListView modeList = new ListView(this);

    stringArray = weather.temp
    # String[] stringArray = new String[] { "Bright Mode", "Normal Mode" };
    # modeAdapter = Android::Widget::ArrayAdapter.new(self) #, android.R.layout.simple_list_item_1, android.R.id.text1, stringArray)
    # modeList.setAdapter(modeAdapter)
    @beer_list.adapter = Android::Widget::ArrayAdapter.new(self, Android::R::Layout::Simple_list_item_1, stringArray)
    # @temperature_label.text = "Temp: #{weather.temp} celcius"
    # @wind_direction_label.text = "Wind Direction: #{weather.wind_direction}"
    # @wind_speed_label.text = "Wind Speed: #{weather.wind_speed} KM"
  end

  def adapter

  end

  def request_queue
    @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
  end

  def new_text_label
    text = Android::Widget::TextView.new(self)
    text.textColor = Android::Graphics::Color::WHITE
    text.gravity = Android::View::Gravity::CENTER_HORIZONTAL
    text.textSize = 40.0
    text
  end

end
