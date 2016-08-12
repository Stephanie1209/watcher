class AddGithubNumberToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :github_number, :string
  end
end
