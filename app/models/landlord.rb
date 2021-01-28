# == Schema Information
#
# Table name: landlords
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Landlord < ApplicationRecord
end
