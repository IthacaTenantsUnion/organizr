# == Schema Information
#
# Table name: leases
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  unit_id      :integer
#  landlord_id  :integer
#  rent_portion :integer
#  rent_total   :integer
#  start_date   :date
#  end_date     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Lease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
