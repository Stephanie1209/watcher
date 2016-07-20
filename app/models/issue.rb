class Issue < ActiveRecord::Base
  belongs_to :repository
  scope :status_closed, -> { where(status: 'closed') }
  scope :status_open, -> { where(status: 'open') }
end
