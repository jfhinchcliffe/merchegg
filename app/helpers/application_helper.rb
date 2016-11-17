module ApplicationHelper

  def monetise(cents)
    "$ #{cents/100}"
  end

  def format_date(date)
    date.strftime("%A, %d %B, %Y")
  end

end
