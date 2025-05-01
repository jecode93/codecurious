module ApplicationHelper
  include Pagy::Frontend

  def role_color(role)
    case role
    when "Super admin" then "bg-blue-600"
    when "Admin" then "bg-blue-500"
    when "Editor" then "bg-blue-400"
    end
  end

  def article_status_color(article)
    case article
    when "Published" then "bg-green-600"
    when "Draft" then "bg-yellow-600"
    when "Archived" then "bg-gray-600"
    end
  end

  def highlight_keywords(text, keywords, css_class: "text-primary")
    keywords.reduce(text) do |result, keyword|
      result.gsub(/(#{Regexp.escape(keyword)})/i) do |match|
        "<span class=\"#{css_class}\">#{match}</span>"
      end
    end.html_safe
  end
end
