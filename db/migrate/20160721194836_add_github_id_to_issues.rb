class AddGithubIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :github_id, :string
  end
end
