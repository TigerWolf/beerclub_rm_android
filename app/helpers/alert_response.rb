class AlertResponse

  def onClick(dialog, which)
      p dialog
      if which == -1
          # OK
          p "ok"
      end
      if which == -2
          p "cancel"
          # Cancel
      end
      # p dialog
      # p which
      p "We clicked a dialog!"
  end

end
