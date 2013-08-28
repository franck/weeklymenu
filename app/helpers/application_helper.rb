module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  def icon(name, white=false)
    classes = ["icon-#{name}"]
    classes << "icon-white" if white
    "<i class='#{classes.join(' ')}'></i>".html_safe
  end

end
