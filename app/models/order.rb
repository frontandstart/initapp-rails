class Order < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { minimum: 4, maximum: 20 }
  validates :project_type, presence: true
  validates :message, length: { maximum: 1000 }
  validates :status, inclusion: { in: %w[new in_progress completed cancelled] }

  before_validation :set_default_status, on: :create
  before_validation :normalize_phone
  after_create :send_notifications

  scope :recent, -> { order(created_at: :desc) }
  scope :by_status, ->(status) { where(status: status) }

  PROJECT_TYPES = {
    'webapp' => 'Веб-приложение',
    'mobile' => 'Мобильное приложение', 
    'backend' => 'Бэкенд-система',
    'fullstack' => 'Fullstack решение',
    'devops' => 'DevOps и инфраструктура',
    'other' => 'Другое'
  }.freeze

  def project_type_name
    PROJECT_TYPES[project_type] || project_type
  end

  def formatted_phone
    return phone unless phone&.match?(/^\+?[0-9\s\-\(\)]+$/)
    phone.gsub(/[^\d+]/, '').gsub(/(\+7|8)(\d{3})(\d{3})(\d{2})(\d{2})/, '+7 (\2) \3-\4-\5')
  end

  private

  def set_default_status
    self.status ||= 'new'
  end

  def normalize_phone
    return unless phone.present?
    # Убираем все символы кроме цифр и +
    cleaned = phone.gsub(/[^\d+]/, '')
    # Заменяем 8 на +7 если номер начинается с 8
    cleaned = cleaned.sub(/^8/, '+7') if cleaned.start_with?('8')
    # Добавляем +7 если номер начинается с 9
    cleaned = "+7#{cleaned}" if cleaned.match?(/^9\d{9}$/)
    self.phone = cleaned
  end

  def send_notifications
    OrderNotificationJob.perform_later(self.id)
  end
end
