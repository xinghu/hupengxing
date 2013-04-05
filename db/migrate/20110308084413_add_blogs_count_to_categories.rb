class AddBlogsCountToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :blogs_count, :integer, :default => 0

    add_index :blogs, :id
    add_index :blogs, :title
    add_index :blogs, :category_id
    add_index :blogs, :tags

    add_index :categories, :id
    add_index :categories, :title
    add_index :categories, :blogs_count
  end

  def self.down
    remove_column :categories, :blogs_count

    remove_index :blogs, :id
    remove_index :blogs, :title
    remove_index :blogs, :category_id
    remove_index :blogs, :tags

    remove_index :categories, :id
    remove_index :categories, :title
    remove_index :categories, :blogs_count
  end
end
