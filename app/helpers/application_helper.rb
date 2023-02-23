module ApplicationHelper

  # Returns the flash alert class based on the flash type
  def get_flash_alert_class(name)
    if name.downcase == 'success'
      'success'
    elsif name.downcase == 'notice'
      'info'
    elsif name.downcase == 'warning'
      'warning'
    elsif name.downcase == 'error'
      'danger'
    else
      ''
    end
  end

  # Returns the flash icon class based on the flash type
  def get_flash_icon_class(name)
    if name.downcase == 'success'
      'check-circle-fill'
    elsif name.downcase == 'notice'
      'info-circle-fill'
    elsif name.downcase == 'warning'
      'exclamation-triangle-fill'
    elsif name.downcase == 'error'
      'exclamation-triangle-fill'
    else
      ''
    end
  end

  # Returns the "active" class if the current url is the specified action's page
  def get_active_page_class(action)
      is_page(action) ? "active" : nil
  end

  # Returns the "active" class if the current url is the specified action's page
  def is_page(action)
    bla = params
    if params[:action] == "index"
      params[:controller] == action
    else
      params[:action] == action
    end
  end

end
