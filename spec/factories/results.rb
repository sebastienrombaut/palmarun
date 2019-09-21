FactoryBot.define do
  factory :result do
    general_classification { "MyString" }
    race_id { 1 }
    user_id { 1 }
    running_time { 1 }
  end
end
