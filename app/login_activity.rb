class LoginActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    self.requestWindowFeature(Android::View::Window::FEATURE_NO_TITLE)
    # setContentView(Android::R.layout.activity_login)
    layoutId = resources.getIdentifier('activity_login', 'layout', packageName)
    self.contentView = layoutId
    button = findViewById(resources.getIdentifier('login_button', 'id', packageName))
    button.setOnClickListener(self)
  end

  def onClick(view)
    sendMessage(view)
  end

  def sendMessage(view)
    intent = Android::Content::Intent.new(self, BeerActivity)

    editText = findViewById(resources.getIdentifier('username','id',packageName))
    username = editText.getText.toString
    intent.putExtra("username",username)

    editText = findViewById(resources.getIdentifier('password','id',packageName))
    password = editText.getText.toString
    intent.putExtra("password",password)

    startActivity(intent)
  end

end
