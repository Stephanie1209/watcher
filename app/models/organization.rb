class Organization < ActiveRecord::Base
  has_many :repositories
  has_many :issues, through: :repositories
  has_many :pull_requests, through: :repositories
end
