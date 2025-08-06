class Photo < ApplicationRecord
  belongs_to :project
  has_one_attached :image
  
  validates :image, presence: true
  validates :position, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  scope :ordered, -> { order(:position) }
  
  # Создание thumbnail в формате WebP
  def thumbnail(size = '300x300')
    return unless image.attached?
    
    image.variant(
      resize_to_fill: size.split('x').map(&:to_i),
      format: :webp,
      quality: 85
    )
  end
  
  # Создание большого изображения в формате WebP
  def large_image(size = '1200x800')
    return unless image.attached?
    
    image.variant(
      resize_to_limit: size.split('x').map(&:to_i),
      format: :webp,
      quality: 90
    )
  end
  
  # Оригинальное изображение в WebP
  def webp_image
    return unless image.attached?
    
    image.variant(format: :webp, quality: 95)
  end
end
