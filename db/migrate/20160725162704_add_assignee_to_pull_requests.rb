class AddAssigneeToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :assignee, :string
  end
end
