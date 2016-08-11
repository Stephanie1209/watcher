class Commit < ActiveRecord::Base
  belongs_to :branch

  scope :between_dates, -> (since, to) { where("committed_at >= ? AND committed_at <= ?", since, to) }
end
