module ArticlesHelper
  def hero_text = [
    {
      title: "Where code questions get answered",
      description: "Welcome to my personal coding dictionary! This blog is where I document answers to my software engineering
    questions. Whenever I forget a concept, need clarity on a term, or want to revisit a lesson, I turn here. It is
    ideal for anyone who wants a go-to guide for solving coding problems and understanding key concepts."
    }
  ]

  def show_date(article_date)
    article_date.created_at.strftime("%b %d, %Y")
  end
end
