class Project < ApplicationRecord
  has_many :photos, -> { order(:position) }, dependent: :destroy
  
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-]+\z/ }
  validates :url, format: { with: URI::regexp(%w[http https]), message: 'должен быть валидным URL' }, allow_blank: true
  
  scope :published, -> { where(published: true) }
  scope :ordered, -> { order(:position, :created_at) }
  
  before_validation :generate_slug, if: -> { slug.blank? && title.present? }
  
  def to_param
    slug
  end
  
  private
  
  def generate_slug
    self.slug = title.downcase.gsub(/[^a-z0-9\s]/, '').gsub(/\s+/, '-')
  end
end
