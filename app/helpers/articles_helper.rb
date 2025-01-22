module ArticlesHelper
  def hero_text = [
    {
      title: "Answers to My Coding Curiosities",
      description: "Welcome to my personal coding journal! Here, I share answers to the questions I’ve faced on my coding journey. It’s my way of keeping track of lessons learned, and I hope it becomes a helpful guide for beginners and curious coders alike."
    }
  ]

  def show_date(article_date)
    article_date.created_at.strftime("%b %d, %Y")
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when "notice" then "success"
    when "alert" then "danger"
    end
  end
end
