class Repository < ActiveRecord::Base
  belongs_to :organization
  has_many :branches
  has_many :issues
  has_many :pull_requests
  has_many :commits, through: :branches

  scope :order_by_most_commits, -> {
    select("repositories.*, count(commits.id) AS commits_count").
    joins(:commits).
    group("repositories.id").
    order("commits_count DESC")
  }

  scope :is_private, -> { where(is_private: true) }
  scope :is_public, -> { where(is_private: false) }

  def search since = nil, to = nil
    if since && to
      result = between_dates(since,to)
    elsif since
      result = repo.since(since)
    elsif to
      result = repo.to(to)
    else
      result = repo.commits
    end
      result = commits.all.count
  end
    result.count
end
