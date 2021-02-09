module RatingsHelper
  def rating_grade(average, tag_type = :strong)
    rating = clamp_rating(average)
    content_tag(tag_type, rating, class: ['grade', rating])
  end

  def rating_icon(value, show_text = false)
    icon_name, text = case value.to_s
    when '0'
      ['angry', show_text ? 'Awful' : '']
    when '1'
      ['frown', show_text ? 'Poor' : '']
    when '2'
      ['meh', show_text ? 'OK' : '']
    when '3'
      ['smile', show_text ? 'Good' : '']
    else
      [show_text ? 'comment-slash' : '', show_text ? 'N/A' : '']
    end
    icon('fas', icon_name, text)
  end

  def clamp_rating(value)
    case value.to_f
    when 0...1
      "F"
    when 1...1.5
      "D"
    when 1.5...2
      "C"
    when 2...2.5
      "B"
    when 2.5..3
      "A"
    end
  end
end
