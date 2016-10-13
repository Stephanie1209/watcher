class Commit < ActiveRecord::Base
  belongs_to :branch
  has_one :repository, through: :branch
  scope :order_by_newest, -> { order(committed_at: :desc) }
  scope :between_dates, -> (since, to) { where("committed_at >= ? AND committed_at <= ?", since, to) }
  scope :since, -> (since) { where("committed_at >= ?", since) }
  scope :to, -> (to) { where("committed_at <= ?", to) }

  def search repository = nil, since = nil, to = nil
    if since && to
      @commits = repo.between_dates(since,to)
    elsif since
      @commits = repo.since(since)
    elsif to
      @commits = repo.to(to)
    else
      @commits = repo
    end
    @commits.group(:author).order('count_all_desc').count
  end
end
