class ChangeColumnName < ActiveRecord::Migration
  def self.up
    rename_column :blogs, :comments_count, :reviews_count
  end

  def self.down
    rename_column :blogs, :reviews_count, :comments_count
  end
end
