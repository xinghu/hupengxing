class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :blog
      t.string :email, :name
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
