module TagsHelper
  def display_tags(tags)
    tags.map{|tag| content_tag(:span, tag.name, id: "tag-#{tag.id}", class: 'tag-remove') }.join(' ').html_safe
  end

end
