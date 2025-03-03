module ArticlesHelper
  def hero_text = [
    {
      title: "Answers to My Coding Curiosities",
      description: "Welcome to my coding journal! I share answers to challenges I’ve faced, keeping track of lessons learned while helping beginners and curious coders."
    }
  ]

  def links = [
    # {
    #   title: "Home",
    #   link: root_path
    # },
    {
      title: "About",
      link: "/about"
    },
    {
      title: "Contact",
      link: "/contact"
    }
  ]

  def services = [
    {
      icon: "/icons/web.svg", # A combined icon for both services
      title: "Web & Mobile Development",
      href: "https://jeanemmanuelcadet.com/services#web-mobile",
      description:
        "I provide top-notch development services for both web and mobile platforms. From dynamic landing pages and sophisticated web applications to sleek and robust mobile apps for Android and iOS, I deliver custom solutions that captivate and engage your audience.",
      price: "20" # Adjust price to reflect combined services, if applicable
    },
    {
      icon: "/icons/api.svg",
      title: "API development",
      href: "https://jeanemmanuelcadet.com/services#api",
      description:
        "Integrate and streamline your systems with secure, scalable APIs designed to meet your specific requirements.",
      price: "25"
    },
    {
      icon: "/icons/database.svg",
      title: "Database design and management",
      href: "https://jeanemmanuelcadet.com/services#database",
      description:
        "Design and manage robust databases that efficiently store and organize your critical data, ensuring optimal performance and reliability.",
      price: "35"
    }
  ]

  def show_date(article_date)
    article_date.updated_at.strftime("%b %d, %Y")
  end

  def tailwind_class_for(flash_type)
    case flash_type
    when "notice" then "bg-green-100 text-green-800"
    when "alert" then "bg-red-100 text-red-800"
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
