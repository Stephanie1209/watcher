class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.string :github_account
      t.string :title
      t.string :string
      t.string :description
      t.string :labels
      t.string :status
      t.references :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
