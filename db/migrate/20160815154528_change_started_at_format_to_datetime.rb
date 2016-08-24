class ChangeStartedAtFormatToDatetime < ActiveRecord::Migration
  def up
    remove_column :issues, :started_at
    remove_column :pull_requests, :started_at
    add_column :issues, :started_at, :datetime
    add_column :pull_requests, :started_at, :datetime
  end

  def down
    remove_column :issues, :started_at
    remove_column :pull_requests, :started_at
    add_column :issues, :started_at, :datetime
    add_column :pull_requests, :started_at, :datetime
  end
end
