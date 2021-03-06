class LoginActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    self.requestWindowFeature(Android::View::Window::FEATURE_NO_TITLE)
    # setContentView(Android::R.layout.activity_login)
    layoutId = resources.getIdentifier('activity_login', 'layout', packageName)
    self.contentView = layoutId

    if RUBYMOTION_ENV != "release"
      username_field = findViewById(resources.getIdentifier('username', 'id', packageName))
      username_field.setText "a1673450"

      password_field = findViewById(resources.getIdentifier('password', 'id', packageName))
      password_field.setText "<nac33841>"
    end

    button = findViewById(resources.getIdentifier('login_button', 'id', packageName))
    button.setOnClickListener(self)
  end

  def onClick(view)
    sendMessage(view)
  end

  def sendMessage(view)
    # intent = Android::Content::Intent.new(self, BeerActivity)
    intent = Android::Content::Intent.new(self, AvaliableActivity)
    # intent = Android::Content::Intent.new(self, ScannerActivity)
    # intent = Android::Content::Intent.new(self, AccountActivity)

    editText = findViewById(resources.getIdentifier('username','id',packageName))
    username = editText.getText.toString
    intent.putExtra("username",username)

    editText = findViewById(resources.getIdentifier('password','id',packageName))
    password = editText.getText.toString
    intent.putExtra("password",password)

    startActivity(intent)
  end

end
