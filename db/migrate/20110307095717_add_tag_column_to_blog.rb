class AddTagColumnToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :tags, :string
  end

  def self.down
    remove_column :blogs, :tags
  end
end
