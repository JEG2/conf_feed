FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "123"
    password_confirmation { |u| u.password }
    verified_at { Time.now }
  end
end
