class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :github_account
      t.string :title
      t.text :description
      t.string :labels
      t.string :status
      t.references :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
