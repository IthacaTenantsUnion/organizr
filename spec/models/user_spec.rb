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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is invalid without an email" do
      expect(build(:user, email: nil)).to be_invalid
    end
  end
end
