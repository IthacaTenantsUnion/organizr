module RatingsHelper
  def rating_icon(value, show_text = false)
    icon_name, text = case value.to_s
    when '-1'
      ['frown', show_text ? 'Poor' : '']
    when '0'
      ['meh', show_text ? 'OK' : '']
    when '1'
      ['smile', show_text ? 'Good' : '']
    else
      [show_text ? 'comment-slash' : '', show_text ? 'N/A' : '']
    end
    icon('fas', icon_name, text)
  end
end
