class Word < ApplicationRecord
  validates :content, presence: true

  belongs_to :text

  scope :recently_updated, -> { where("updated_at": 1.minutes.ago..) }
end