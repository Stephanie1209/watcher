class AddGithubIdToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :github_id, :string
  end
end
