module ArticlesHelper
  def hero_text = [
    {
      title: "Answers to My Coding Curiosities",
      description: "Welcome to my personal coding journal! Here, I share answers to the questions I’ve faced on my coding journey. It’s my way of keeping track of lessons learned, and I hope it becomes a helpful guide for beginners and curious coders alike."
    }
  ]

  def links = [
    {
      title: "Home",
      link: root_path
    },
    {
      title: "About",
      link: "/about"
    },
    {
      title: "Contact",
      link: "/contact"
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

  def reading_time(article)
    words_per_minute = 200
    word_count = article.body.to_s.split(/\s+/).size
    time = (word_count / words_per_minute.to_f).ceil

    if time == 1
      "#{time} minute"
    else
      "#{time} minutes"
    end
  end
end
