class AddSeoDescToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :seo_desc, :text
  end

  def self.down
    remove_column :blogs, :seo_desc
  end
end
