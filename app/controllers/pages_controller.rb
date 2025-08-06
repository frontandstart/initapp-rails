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
    end

    if template_exists?("pages/#{page}")
      render "pages/#{page}" 
    else
      redirect_to root_path
    end
  end
end
