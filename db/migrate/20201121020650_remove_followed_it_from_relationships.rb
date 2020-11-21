class RemoveFollowedItFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :followed_it, :integer
  end
end
