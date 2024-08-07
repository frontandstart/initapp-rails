class PagesController < ApplicationController

  def index
    if params['path']
      if template_exists?("pages/#{params['path']}")
        render "pages/#{params['path']}"
      else
        redirect_to root_path
      end
    end
  end
end
