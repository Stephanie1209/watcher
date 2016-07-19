class Branch < ActiveRecord::Base
  has_many :issues
  belongs_to :repository
end
