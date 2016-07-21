FactoryGirl.define do
  factory :branch do
    name { Faker::Lorem.word }
    repository
    
    factory :dev do
      name "dev"
      repository
    end
  end
end
