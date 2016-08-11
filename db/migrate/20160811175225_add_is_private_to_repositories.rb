class AddIsPrivateToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :is_private, :boolean, default: false, null: false
  end
end
