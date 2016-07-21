FactoryGirl.define do
  factory :pull_request do
    github_account { Faker::Hipster.word }
    title { Faker::Hipster.words(4) }
    description { Faker::Hipster.paragraph }
    labels { Faker::Hipster.word  }
    status { Faker::Hipster.word  }
    repository

    factory :specific_pull do
      github_account 'IcaliaLabs'
      title 'Commits api'
      description 'Create the following models'
      labels  nil
      status 'closed'
      repository
    end
  end
end
