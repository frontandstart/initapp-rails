module SeoHelper

  def meta_tags(options)
    options = HashWithIndifferentAccess.new(options)
    {
      title: options[:title].presence || Setting.site_name,
      description: options[:description].presence || Setting.description,
      keywords: options[:keywords].presence || Setting.keywords,
      og: {
        title: options[:title].presence || Setting.site_name,
        description: options[:description].presence || Setting.description,
        image: options[:og_image].presence || Setting.og_image,
        type: options[:og_type].presence,
        url: request.original_url
      }
    }
  end
end
