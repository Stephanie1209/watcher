class CommitSerializer < ActiveModel::Serializer
  attributes :sha, :total, :additions, :deletions, :commited_at, :branch_id
end
