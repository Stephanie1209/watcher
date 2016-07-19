FactoryGirl.define do
  factory :branch do
    name { Faker::Lorem.word }
  end

  factory :dev, class: Branch do
    name "dev"
  end
end
