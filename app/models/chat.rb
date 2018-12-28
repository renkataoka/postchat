class Chat < ApplicationRecord
  validates :name, presence: true
  validates :content, length: { in: 1..140 }
end
