class AlertHelper
  def initialize(activity, listener = nil)
    @activity = activity
    @listener = listener
    @listener = activity if listener.nil?
    @only_ok = false
  end

  def dialog(title, message)
    r_string_yes = 17039379
    r_string_no = 17039369
    ab = Android::App::AlertDialog::Builder.new(@activity)
        .setTitle(title)
        .setMessage(message)
        .setPositiveButton(r_string_yes, @listener)

        # for some reason this was the isuse

    if @only_ok == true

    else
      ab.setNegativeButton(r_string_no, @listener)
    end

    ab.show
  end

  def only_ok=(only_ok)
    @only_ok = only_ok
  end
end
