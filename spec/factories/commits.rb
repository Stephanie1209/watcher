FactoryGirl.define do
  factory :commit do
    sha { Faker::Lorem.characters(25) }
    total { Faker::Number.number(3) }
    additions { Faker::Number.number(3) }
    deletions { Faker::Number.number(3) }
    committed_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    branch
  end

  factory :specific_commit, class: Commit do
    sha '73862f61dce37853755aabfcd6b819c7e7b70f9e'
    total 93
    additions 74
    deletions 19
    committed_at "2011-01-26 19:01:12.000000000 +0000"
    branch
  end
end
