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

  field :site_name, type: :string, default: "Initapp"
  field :description, type: :string, default: "Description"
  field :keywords, type: :string, default: "Keywords, Initapp, Rails, Ruby, App"
  field :og_image, type: :string, default: "Initapp"
  field :og_type, type: :string, default: "website"
  field :og_url, type: :string, default: "Initapp"
end
