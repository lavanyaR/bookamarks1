class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.text :discription
      t.integer :user_id
      t.string     :url

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
