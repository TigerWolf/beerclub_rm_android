class ScannerActivity < Android::App::Activity

    attr_reader :username, :password

    def onCreate state
        super
        @barcode = nil
        extras = getIntent.getExtras
        if (extras != nil)
          @username = extras.getString("username");
          @password = extras.getString("password");
        end

        # @mScannerView = Me::Dm7::Barcodescanner::Zxing::ZXingScannerView.new(self)
        # me/dm7/barcodescanner/zxing/ZXingScannerView
        # setContentView(@mScannerView)
        if(state == nil)
            scanIntegrator = Com::Google::Zxing::Integration::Android::IntentIntegrator.new(self)
            scanIntegrator.addExtra("RESULT_DISPLAY_DURATION_MS", 0)
            scanIntegrator.initiateScan
        end

        # intent = Com::Google::Zxing::Integration::Android::Intent.new("com.google.zxing.client.android.SCAN");
    end

    def onResume
        super
    end

    def onPause
        super
    end

    def handleResult(rawResult)

    end

    def onActivityResult(requestCode, resultCode, intent)
        super

        @barcode = nil
        scanningResult = Com::Google::Zxing::Integration::Android::IntentIntegrator.parseActivityResult(requestCode, resultCode, intent)
        if (scanningResult != nil)
            scanContent = scanningResult.getContents
            format = scanningResult.getFormatName # Maybe getting this too will stop scanner
            if scanContent.nil?
                finish
            else
                send_beer_barcode(scanContent)
            end
        else
            toast = Android::Widget::Toast.makeText(getApplicationContext(), "No scan data received!", Toast.LENGTH_SHORT)
            toast.show
        end
    end

    def send_beer_barcode(barcode)
        @barcode = barcode
        AlertHelper.new(self).dialog("Log Beer", "Are you sure you want to purchase this beer?" )
    end

    def request_queue
      @request_queue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    end

    def onClick(dialog, which)
        p dialog
        if which == -1
            # OK
            p "ok"
            url = "https://beer.services.adelaide.edu.au/bc/api/account_self_serve/?format=json"
            listener = RequestListener.new(self, Barcode)
            error_listener = ErrorListener.new(self, Barcode)

            params = {}
            params[Java::Lang::String.new("barcode")] = Java::Lang::String.new(@barcode)

            post = MyPostRequest.new(VolleyMethods::POST, url, params, listener, error_listener)
            post.username = @username
            post.password = @password
            # request_queue.params = getParams
            request_queue.add(post)

        end
        if which == -2
            p "cancel"
            # Cancel
        end
        # p dialog
        # p which
        p "We clicked a dialog!"
    end

    def update_display(object)
        p object
        alert = AlertHelper.new(self, AlertResponse.new)
        alert.only_ok = true
        alert.dialog("Submitted", "Your beer has been logged with the server." )
    end

    def onOptionsItemSelected item
      SharedMenu.new(self).onOptionsItemSelected item
    end

    def onCreateOptionsMenu menu
      SharedMenu.new(self).onCreateOptionsMenu menu
    end

end
