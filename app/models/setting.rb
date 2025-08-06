# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret,si default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true

  field :site_name, type: :string, default: "Rubyvkube - Разработка комплексных IT-решений"
  field :description, type: :string, default: "Разработка веб-приложений, мобильных приложений, бэкенд-систем и DevOps-решений. Ruby on Rails, Go, Rust, React, Svelte, Angular, .NET. Docker, Kubernetes."
  field :keywords, type: :string, default: "разработка сложных проектов, создание сайтов под ключ, разработка сайта для бизнеса, веб-студия, разработка сайта цена, портфолио веб-студии, Ruby on Rails, Go, Rust, React, Svelte, Angular, мобильные приложения, DevOps, Docker, Kubernetes, Rubyvkube"
  field :og_image, type: :string, default: "/icon.png"
  field :og_type, type: :string, default: "website"
  field :og_url, type: :string, default: "https://rubyvkube.ru"
end
