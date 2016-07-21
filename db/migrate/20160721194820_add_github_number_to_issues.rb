class AddGithubNumberToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :github_number, :string
  end
end
