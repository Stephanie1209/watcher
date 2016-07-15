class Organization < ActiveRecord::Base
  alias :read_attribute_for_serialization :send
end
