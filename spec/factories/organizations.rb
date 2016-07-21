FactoryGirl.define do
  factory :organization do
    github_name { Faker::Lorem.word }
    description { Faker::Company.catch_phrase }
    avatar { Faker::Avatar.image }
    
    factory :icalialabs do
      github_name "IcaliaLabs"
      description 'We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.'
      avatar "https://avatars.githubusercontent.com/u/2523244?v=3"
    end
  end
end
