class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.integer :stars
      t.integer :forks_count
      t.datetime :started_at
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
