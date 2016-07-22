class RemoveStringFromPullRequests < ActiveRecord::Migration
  def change
    remove_column :pull_requests, :string
  end
end
