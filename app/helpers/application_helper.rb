module ApplicationHelper
  def nav_link_class(path, additional_controllers = [])
    base_class = "text-gray-700 hover:text-blue-600 transition-colors"
    active_class = "font-semibold text-blue-600"
    
    is_active = current_page?(path) || 
                additional_controllers.include?(params[:controller])
    
    is_active ? "#{base_class} #{active_class}" : base_class
  end
  
  def mobile_nav_link_class(path, additional_controllers = [])
    base_class = "block text-gray-700 hover:text-blue-600 transition-colors"
    active_class = "font-semibold text-blue-600"
    
    is_active = current_page?(path) || 
                additional_controllers.include?(params[:controller])
    
    is_active ? "#{base_class} #{active_class}" : base_class
  end
end
