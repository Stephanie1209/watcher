class Commit < ActiveRecord::Base
  belongs_to :branch
  has_one :repository, through: :branch
  scope :order_by_newest, -> { order(committed_at: :desc) }
  scope :between_dates, -> (since, to) { where("committed_at >= ? AND committed_at <= ?", since, to) }
  scope :since, -> (since) { where("committed_at >= ?", since) }
  scope :to, -> (to) { where("committed_at <= ?", to) }

  def search from = nil, untill = nil
    if from && untill
      commits = between_dates(since,to)
    elsif from
      commits = since(since)
    elsif untill
      commits = to(to)
    else
      commits = Commit.all
    end
      commits.count
  end
end
