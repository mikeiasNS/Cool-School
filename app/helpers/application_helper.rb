module ApplicationHelper
  def menu_to(content, href, icon)
    enable_class = request.path.include?(content.downcase) || action_name.include?(content.downcase) ? "active item" : "item"
    link_to(href, class: enable_class) do
      content_tag(:i, nil, class: "#{icon}") + content_tag(:span, t("menu.#{content}"), class: "mobile hidden")
    end
  end
  def include_js(file_path)
    raw Rails.application.assets["#{file_path}.js"].to_s
  end
end
