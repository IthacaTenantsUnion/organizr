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
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password { 'SomePasswordThatWorks' }
    password_confirmation { 'SomePasswordThatWorks' }
    role { 'tenant' }
    race { %w(black white asian latino).sample }
    gender { %w(male female non-binary) }

    trait :tenant do
      role { 'tenant' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
