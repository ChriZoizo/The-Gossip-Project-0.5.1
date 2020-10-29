class Gossip < ApplicationRecord
    has_many :tags, through: :gossip_tags
    belongs_to :user
    has_many :comments

    has_many :like

    validates :title,
    presence: true,
    length: { in: 3..14 }

    validates :content,
    presence: true
end