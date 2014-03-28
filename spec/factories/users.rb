# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Jhon Doe"
    email "user@example.com"
    password "examplepass"
    password_confirmation "examplepass"
  end
end
