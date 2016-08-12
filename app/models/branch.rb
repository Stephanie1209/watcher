class Branch < ActiveRecord::Base
  has_many :commits, dependent: :destroy
  belongs_to :repository
end
