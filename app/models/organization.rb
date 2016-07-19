class Organization < ActiveRecord::Base
  has_many :repositories
end
