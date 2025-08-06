class PagesController < ApplicationController
  def index
    page = params[:path] || 'index'
    
    # SEO meta tags for main page
    if page == 'index'
      @meta_tags = {
        title: "Rubyvkube - Разработка комплексных IT-решений для бизнеса",
        description: "Профессиональная разработка веб-приложений, мобильных приложений, бэкенд-систем и DevOps-решений. Используем Ruby on Rails, Go, Rust, React, Svelte, Angular, .NET. Docker, Kubernetes, CI/CD.",
        keywords: "разработка сложных проектов, создание сайтов под ключ, разработка сайта для бизнеса, веб-студия, разработка сайта цена, портфолио веб-студии, Ruby on Rails, Go, Rust, React, Svelte, Angular, мобильные приложения, DevOps, Docker, Kubernetes, веб-приложения, бэкенд разработка, fullstack разработка",
        og_image: "#{request.base_url}/icon.png",
        og_type: "website"
      }
      
      # Structured data for services
      @structured_data = {
        "@context": "https://schema.org",
        "@type": "WebPage",
        "name": "Rubyvkube - Разработка комплексных IT-решений",
        "description": "Профессиональная разработка веб-приложений, мобильных приложений, бэкенд-систем и DevOps-решений",
        "url": "https://rubyvkube.ru",
        "mainEntity": {
          "@type": "Organization",
          "name": "Rubyvkube",
          "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": "IT-услуги",
            "itemListElement": [
              {
                "@type": "Offer",
                "itemOffered": {
                  "@type": "Service",
                  "name": "Веб-приложения",
                  "description": "Современные SPA и PWA на React, Svelte, Angular"
                },
                "priceSpecification": {
                  "@type": "PriceSpecification",
                  "price": "200000",
                  "priceCurrency": "RUB",
                  "valueAddedTaxIncluded": true
                }
              },
              {
                "@type": "Offer",
                "itemOffered": {
                  "@type": "Service",
                  "name": "Мобильные приложения",
                  "description": "Нативные и кроссплатформенные приложения для iOS и Android"
                },
                "priceSpecification": {
                  "@type": "PriceSpecification",
                  "price": "300000",
                  "priceCurrency": "RUB",
                  "valueAddedTaxIncluded": true
                }
              },
              {
                "@type": "Offer",
                "itemOffered": {
                  "@type": "Service",
                  "name": "Бэкенд-системы",
                  "description": "Высоконагруженные API и микросервисы на Ruby on Rails, Go, Rust, .NET"
                },
                "priceSpecification": {
                  "@type": "PriceSpecification",
                  "price": "150000",
                  "priceCurrency": "RUB",
                  "valueAddedTaxIncluded": true
                }
              },
              {
                "@type": "Offer",
                "itemOffered": {
                  "@type": "Service",
                  "name": "DevOps & Инфраструктура",
                  "description": "Настройка CI/CD, контейнеризация, оркестрация с Docker Swarm/Kubernetes"
                },
                "priceSpecification": {
                  "@type": "PriceSpecification",
                  "price": "100000",
                  "priceCurrency": "RUB",
                  "valueAddedTaxIncluded": true
                }
              }
            ]
          }
        }
      }
    end

    if template_exists?("pages/#{page}")
      render "pages/#{page}" 
    else
      redirect_to root_path
    end
  end
end
