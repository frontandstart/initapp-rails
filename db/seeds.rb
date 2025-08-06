# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(email: 'mail@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Создание тестовых проектов для портфолио
projects_data = [
  {
    title: "Интернет-магазин электроники TechStore",
    slug: "techstore-ecommerce",
    description: "Полнофункциональный интернет-магазин с каталогом товаров, корзиной, системой оплаты и административной панелью. Реализованы фильтры по категориям, поиск, сравнение товаров и система отзывов.",
    published: true,
    position: 1
  },
  {
    title: "Мобильное приложение для фитнес-тренировок FitTracker",
    slug: "fittracker-mobile-app", 
    description: "Кроссплатформенное мобильное приложение для отслеживания тренировок, питания и прогресса. Включает планы тренировок, счетчик калорий, социальные функции и интеграцию с фитнес-трекерами.",
    published: true,
    position: 2
  },
  {
    title: "Корпоративная CRM-система для управления клиентами",
    slug: "corporate-crm-system",
    description: "Система управления взаимоотношениями с клиентами с функциями ведения базы клиентов, отслеживания сделок, аналитики продаж и автоматизации маркетинга. Интеграция с популярными сервисами.",
    published: true,
    position: 3
  }
]

projects_data.each do |project_data|
  project = Project.find_or_create_by(slug: project_data[:slug]) do |p|
    p.title = project_data[:title]
    p.description = project_data[:description]
    p.published = project_data[:published]
    p.position = project_data[:position]
  end
  
  puts "Создан проект: #{project.title}"
end

puts "Seed данные загружены!"