class AddStartedAtToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :started_at, :string
  end
end
