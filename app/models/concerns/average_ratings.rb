module AverageRatings
  def overall_average
    return nil if size.zero?
    average(:overall).to_f
  end

  def repairs_average
    ratings = self.where.not(repairs: nil)
    return nil if ratings.empty?
    
    ratings.average(:repairs).to_f
  end
end