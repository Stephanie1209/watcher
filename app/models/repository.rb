class Repository < ActiveRecord::Base
  belongs_to :organization
  has_many :branches
  has_many :issues
  has_many :pull_requests
end
