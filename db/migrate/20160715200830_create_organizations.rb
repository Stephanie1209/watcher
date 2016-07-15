class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :github_name
      t.text :description
      t.string :avatar

      t.timestamps null: false
    end
  end
end
