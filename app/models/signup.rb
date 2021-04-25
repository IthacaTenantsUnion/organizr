class Signup
  include ActiveModel::Model

  attr_accessor :user, :rating, :overall, :repairs

  delegate :overall, to: :rating
  delegate :repairs, to: :rating
  delegate :name, to: :user

  def initialize(attributes = {})
    @attributes = attributes
    @user ||= find_or_initialize_user(attributes) || User.new
    @landlord ||= find_or_initialize_landlord(attributes) || Landlord.new
    @unit ||= find_or_initialize_unit(attributes) || Unit.new
    @rating ||= find_or_initialize_rating(landlord_id: @landlord.id, user_id: @user.id, unit_id: @unit.id, attributes) || Rating.new
    binding.pry
  end

  def save
    binding.pry
  end

  private

  def find_or_initialize_user(params)
    @user = User.find_or_initialize_by(email: params.dig('email')) do |u|
      u.name = params.dig('name')
    end
  end

  def find_or_initialize_landlord(params)
    @landlord = Landlord.find_or_initialize_by(name: params.dig('landlord_name'))
  end

  def find_or_initialize_unit(params)
    @unit = Unit.find_or_initialize_by(address: params.dig('unit_address'))
  end

  def find_or_initialize_rating(landlord_id:, user_id:, unit_id:, params)
    @rating = Rating.find_or_initialize_by(landlord_id: @landlord.id, user_id: @user.id, unit_id: @unit.id)
  end


#  validates :rent_total, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_total.present? }
#  validates :rent_portion, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_portion.present? }
#  validates :start_date, presence: true
#  validates :end_date, date: { after:  :start_date }, if: lambda{ |t| t.end_date.present? }
end
