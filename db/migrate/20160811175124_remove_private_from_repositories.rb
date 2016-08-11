class RemovePrivateFromRepositories < ActiveRecord::Migration
  def change
    remove_column :repositories, :private, :bool
  end
end
