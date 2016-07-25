class AddStartedAtToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :started_at, :string
  end
end
