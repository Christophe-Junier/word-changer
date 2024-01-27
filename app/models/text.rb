class Text < ApplicationRecord
  validates :content, presence: true

  has_many :words

  after_create :split_into_words

  scope :not_recently_updated, -> { where("updated_at": ..1.minutes.ago) }

  def split_into_words
    words = self.content.split(' ')
    words.each do |word|
      Word.create(content: word, text_id: self.id)
    end

    if words.count != self.words.count
      self.words.destroy_all
    end
  end
end