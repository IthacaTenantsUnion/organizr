# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string           default("guest"), not null
#  race                   :string
#  gender                 :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :tenancies, -> { extending AverageRatings }, dependent: :destroy
  has_many :ratings
  has_many :leases
  has_many :units, through: :tenancies, inverse_of: :tenant
  has_many :landlords, through: :tenancies, inverse_of: :tenants

  enum role: { guest: "guest", tenant: "tenant", admin: "admin" }

  def to_s
    @name ||= Faker::Name.name
  end
end
