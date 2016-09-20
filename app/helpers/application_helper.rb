module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : nil

    content_tag(:a, link_text, :class => class_name, :href => link_path)
  end
end
