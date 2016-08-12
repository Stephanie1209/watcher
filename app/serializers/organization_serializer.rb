class OrganizationSerializer < ActiveModel::Serializer
  attributes :github_name, :description, :avatar
end
