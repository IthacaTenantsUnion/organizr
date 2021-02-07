module AverageRatings
  def overall_average
    average(:overall).to_f
  end

  def repairs_average
    average(:repairs).to_f
  end
end