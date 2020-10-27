class Tag < ApplicationRecord
    has_many :gossips, through: :gossip_tags
end
