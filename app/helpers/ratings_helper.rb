module RatingsHelper
  def rating_grade(average, tag_type = :strong)
    rating = clamp_rating(average)
    return content_tag(tag_type, rating, class: ['grade', rating]) if tag_type.present?
    rating
  end

  def rating_icon(value, show_text = false)
    icon_name, text = case value.to_s
    when '0'
      ['1F621', show_text ? 'Awful' : '']
    when '1'
      ['1F641', show_text ? 'Poor' : '']
    when '2'
      ['1F610', show_text ? 'OK' : '']
    when '3'
      ['1F600', show_text ? 'Good' : '']
    else
      ['1F636', show_text ? 'N/A' : '']
    end

    content_tag :i, class: "emoji" do
      "&#x#{icon_name}; #{text}".html_safe
    end
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
