class RepositorySerializer < ActiveModel::Serializer
  attributes :name, :stars, :forks_count, :started_at, :organization_id
end
