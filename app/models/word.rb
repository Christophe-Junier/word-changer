class Word < ApplicationRecord
  validates :content, presence: true

  belongs_to :text
end