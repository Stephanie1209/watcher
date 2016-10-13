class Commit < ActiveRecord::Base
  belongs_to :branch
  has_one :repository, through: :branch
  scope :order_by_newest, -> { order(committed_at: :desc) }
  scope :between_dates, -> (since, to) { where("committed_at >= ? AND committed_at <= ?", since, to) }
  scope :since, -> (since) { where("committed_at >= ?", since) }
  scope :to, -> (to) { where("committed_at <= ?", to) }

  def search since = nil, to = nil
    if since && to
      @commits = between_dates(since,to)
    elsif since
      @commits = since(since)
    elsif to
      @commits = to(to)
    else
      @commits = Commit.all
    end
    @commits.all.count
  end
end
