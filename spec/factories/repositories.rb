FactoryGirl.define do
  factory :repository do
    name { Faker::Lorem.word }
    stars { Faker::Number.number(2) }
    forks_count { Faker::Number.number(3) }
    started_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    organization
    
    factory :furatto do
      name "Furatto"
      stars 862
      forks_count 136
      started_at "2011-01-26T19:01:12Z"
      organization
    end
  end
end
