class RemoveNameFromTweet < ActiveRecord::Migration
  def change
    remove_column :tweets, :name, :string
  end
end
