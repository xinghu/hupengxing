class AddViewsCount < ActiveRecord::Migration
  def self.up
    add_column :blogs, :views_count,:integer, :default => 0
    add_column :blogs, :comments_count, :integer, :default => 0

    add_column :comments, :ip, :string
  end

  def self.down
    remove_column :blogs, :views_count
    remove_column :blogs, :comments_count

    remove_column :comments, :ip
  end
end
