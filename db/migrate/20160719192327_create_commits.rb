class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.decimal :total
      t.decimal :additions
      t.decimal :deletions
      t.datetime :committed_at
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
