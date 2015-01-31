class BeerListAdapter < Android::Widget::BaseAdapter

    def getView(position, convertView, parent)
        activity = getContext

        row_layout = activity.resources.getIdentifier('row_layout', 'layout', activity.packageName)
        if convertView == nil
            convertView = Android::View::LayoutInflater.from(getContext()).inflate(row_layout, parent, false)
        end

        text1 = convertView.findViewById(activity.resources.getIdentifier('beer_name', 'id', activity.packageName))
        text2 = convertView.findViewById(activity.resources.getIdentifier('brewery', 'id', activity.packageName))

        item = getItem(position)
        text1.setText(item.get("name").toString)
        text2.setText(item.get("brewery").toString)

        convertView.setBackgroundColor(0xFF000000)
        if (item.get("special").toString == "true")
            convertView.setBackgroundColor(0xFFFF8800)
        end

        convertView
    end

    def data
        getHash.get("my_array")
    end

    def getCount
        data.size
    end

    def getItem(position)
        data.get(position)
    end

    def getItemId(position)
        position
    end

end
