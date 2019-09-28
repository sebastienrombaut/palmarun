FactoryBot.define do
  sequence(:name) { |n| "Course n°#{n}" }

  factory :race do
    name
    date { Time.now }
    distance { 10 }
    height_difference { 0 }
  end
end
