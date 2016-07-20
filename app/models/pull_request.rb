class PullRequest < ActiveRecord::Base
  belongs_to :repository
  scope :closed, -> { where(status: 'closed') }
  scope :open, -> { where(status: 'open') }
end
