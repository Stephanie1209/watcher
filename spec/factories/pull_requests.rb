FactoryGirl.define do
  factory :pull_request do
    github_account { Faker::Hipster.word }
    title { Faker::Hipster.words(4) }
    description { Faker::Hipster.paragraph }
    labels { Faker::Hipster.word  }
    status { Faker::Hipster.word  }
    repository
    github_number { Faker::Number.number(3) }
    github_id { Faker::Number.number(2) }
  end

  factory :specific_pull, class: PullRequest do
    github_account 'IcaliaLabs'
    title 'Commits api'
    description 'Create the following models'
    labels  nil
    status 'closed'
    repository
    github_number 107
    github_id 1
  end
end
