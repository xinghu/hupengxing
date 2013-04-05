class ChangeBlogContent < ActiveRecord::Migration
  def self.up
    change_column :blogs, :content, :text
  end

  def self.down
  end
end
