FactoryGirl.define do
  factory :branch do
    name { Faker::Lorem.word }
    repository

    
  end

  factory :dev, class: Branch do
    name "dev"
    repository
  end
end
