require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'steven'
    last_name 'saurbier'
    phone_number '3135705497'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

end
