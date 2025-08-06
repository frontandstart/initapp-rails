# frozen_string_literal: true

return if ENV['CI']

require 'shrine'
# require 'shrine/storage/s3'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
}

Shrine.plugin :url_options, store: { 
  host: ENV.fetch('BACKEND_URL') { 'http://lvh.me:4021' }
}

Shrine.plugin :activerecord
Shrine.plugin :default_storage
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type
Shrine.plugin :derivatives
Shrine.plugin :backgrounding

# TODO: Configure backgrounding for Sidekiq derivatives processing later
