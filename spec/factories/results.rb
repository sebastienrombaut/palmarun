FactoryBot.define do
  factory :result do
    general_classification { "1/20" }
    running_time { 3600 }

    race
    user
  end
end
