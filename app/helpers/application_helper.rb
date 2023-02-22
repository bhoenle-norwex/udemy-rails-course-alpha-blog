module ApplicationHelper

  # Returns the "active" class if the current url is the specified action's page
  def is_active(action)
    if params[:action] == "index"
      params[:controller] == action ? "active" : nil
    else
      params[:action] == action ? "active" : nil
    end
  end

end
