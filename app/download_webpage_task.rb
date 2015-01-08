class DownloadWebpageTaskOld < Android::Os::AsyncTask
    def onPreExecute
        # myProgressBar.setVisibility(View.VISIBLE);
    end

    def doInBackground(urls)
        p urls.is_a? Enumerable
        p urls.respond_to? :each
        p urls
    end

    def onPostExecute(result)
        p result
    end

end
