FactoryBot.define do
  sequence(:email) { |n| "email#{n}@palmarun.fr" }

  factory :user do
    email
    first_name { "Seb" }
    last_name { "R" }

    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
