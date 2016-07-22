FactoryGirl.define do
  factory :issue do
    github_account { Faker::Hipster.word }
    title { Faker::Hipster.words(4) }
    description { Faker::Hipster.paragraph }
    labels { Faker::Hipster.word  }
    status { Faker::Hipster.word  }
    repository
    github_number { Faker::Number.number(3) }
    github_id { Faker::Number.number(2) }
  end

  factory :specific_issue, class: Issue do
    github_account 'IcaliaLabs'
    title 'Add method to search an specific repository'
    description 'Create the following models'
    labels  nil
    status 'closed'
    repository
    github_number 1
    github_id 1
  end
end
