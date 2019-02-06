class Chat < ApplicationRecord
  validates :content, length: { in: 1..140 }
  validates :name, presence: true
end
