# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name  "Example"
    last_name   "User"
    email       "user@example.com"
    password    "foobar1234"
  end
end
