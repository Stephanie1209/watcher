class Commit < ActiveRecord::Base
  belongs_to :branch
  has_one :repository, through: :branch
  scope :order_by_newest, -> { order(committed_at: :desc) }
  scope :between_dates, -> (since, to) { where("committed_at >= ? AND committed_at <= ?", since, to) }
  scope :since, -> (since) { where("committed_at >= ?", since) }
  scope :to, -> (to) { where("committed_at <= ?", to) }
end
