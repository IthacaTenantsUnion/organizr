module AverageRatings
  def overall_average
    sum(:overall) / size.to_f
  end

  def repairs_average
    reviewed_total = where.not(repairs: nil).size
    sum(:repairs) / reviewed_total.to_f
  end
end