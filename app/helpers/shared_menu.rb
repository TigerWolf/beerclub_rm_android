class SharedMenu

  attr_reader :activity, :packageName, :resources, :getMenuInflater

  def initialize(activity)
    @activity = activity
    @resources = activity.resources
    @packageName = activity.packageName
    @getMenuInflater = activity.getMenuInflater
    @username = activity.username
    @password = activity.password
  end

  def onOptionsItemSelected item
    case item.getItemId
    when resources.getIdentifier('action_account', 'id', packageName)
      intent = Android::Content::Intent.new(@activity, AccountActivity)
      intent.putExtra("username",@username)
      intent.putExtra("password",@password)
      start_activity(intent)
    when resources.getIdentifier('action_avaliable', 'id', packageName)
      intent = Android::Content::Intent.new(@activity, AvaliableActivity)
      intent.putExtra("username",@username)
      intent.putExtra("password",@password)
      start_activity(intent)
    when resources.getIdentifier('action_scanner', 'id', packageName)
      intent = Android::Content::Intent.new(@activity, ScannerActivity)
      intent.putExtra("username",@username)
      intent.putExtra("password",@password)
      start_activity(intent)
    when resources.getIdentifier('action_beerlist', 'id', packageName)
      intent = Android::Content::Intent.new(@activity, BeerActivity)
      intent.putExtra("username",@username)
      intent.putExtra("password",@password)
      start_activity(intent)
    when 16908332  # Android::R::Id::Home - resources.getIdentifier('home', 'id', packageName)
      @activity.finish
    end
  end

  def start_activity(intent)
    intent.putExtra("username", @username)
    intent.putExtra("password", @password)
    intent.setFlags(Android::Content::Intent::FLAG_ACTIVITY_REORDER_TO_FRONT)
    @activity.startActivity(intent)
  end

  def onCreateOptionsMenu menu
    menu_id = resources.getIdentifier('main', 'menu', packageName)
    getMenuInflater().inflate(menu_id, menu);
    true
  end

end
