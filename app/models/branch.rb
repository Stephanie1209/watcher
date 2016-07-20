class Branch < ActiveRecord::Base
  has_many :commits
  belongs_to :repository
end
