class AddPrivateToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :private, :bool
  end
end
