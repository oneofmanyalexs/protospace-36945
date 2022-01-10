class Prototype < ApplicationRecord

  belongs_to :user
  belongs_to :prototype
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy,   presence: true
  validates :concept,  presence:true
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end

end
