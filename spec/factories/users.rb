FactoryBot.define do
  factory :user do
    first_name "Aaron"
    last_name "Ramsey"
    sequence(:email) { |n| "test#{n}@example.com" }
  end
end
