class CreateGossipTags < ActiveRecord::Migration[6.0]
  def change
    create_table :gossip_tags do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :tag, index: true
    end
  end
end