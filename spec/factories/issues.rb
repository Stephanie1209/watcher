FactoryGirl.define do
  factory :issue do
    github_account { Faker::Hipster.word }
    title { Faker::Hipster.words(4) }
    description { Faker::Hipster.paragraph }
    labels { Faker::Hipster.word  }
    status { Faker::Hipster.word  }
    repository
  end

  factory :specific_issue, class: Issue do
    github_account 'IcaliaLabs'
    title 'Add method to search an specific repository'
    description 'Create the following models'
    labels  nil
    status 'closed'
    repository
  end
end
