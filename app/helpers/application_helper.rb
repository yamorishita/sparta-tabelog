module ApplicationHelper
  def make_star(rate)
    star = "★" * rate.round + "☆" * (5 - rate.round)
  end
end
