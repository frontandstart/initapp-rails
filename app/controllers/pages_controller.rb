class PagesController < ApplicationController

  def index
    page = params['path'] || 'index'

    if template_exists?("pages/#{page}")
      render "pages/#{page}" 
    else
      redirect_to root_path
    end
  end
end
