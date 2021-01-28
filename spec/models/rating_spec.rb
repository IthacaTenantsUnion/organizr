# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  unit_id    :bigint           not null
#  overall    :integer
#  repairs    :integer
#  review     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Rating, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
