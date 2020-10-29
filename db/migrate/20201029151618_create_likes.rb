class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
