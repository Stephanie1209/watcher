class Repository < ActiveRecord::Base
  belongs_to :organization
  has_many :branches
  has_many :issues
  has_many :pull_requests
  has_many :commits, through: :branches

  scope :is_private, -> { where(is_private: true) }
  scope :is_public, -> { where(is_private: false) }
end
