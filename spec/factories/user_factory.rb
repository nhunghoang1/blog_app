FactoryBot.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email
    password { 'password123' } 
    password_confirmation { 'password123' }
  end
end
