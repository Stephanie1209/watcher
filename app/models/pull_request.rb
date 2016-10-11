class PullRequest < ActiveRecord::Base
  CLOSED = 'closed'
  OPEN = 'open'
  belongs_to :repository
  scope :closed, -> { where(status: 'CLOSED') }
  scope :open, -> { where(status: 'OPEN') }
  scope :order_by_newest, -> { order(started_at: :desc) }
end
