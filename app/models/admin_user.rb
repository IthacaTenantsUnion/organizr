class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable and :omniauthable
  devise :omniauthable, :trackable, :rememberable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless admin = find_by(email: email) # email =~ /@mybusiness.com\z/
    admin.assign_attributes(uid: uid, full_name: full_name, avatar_url: avatar_url)
    admin.save! if admin.changed?
    admin
  end
end
