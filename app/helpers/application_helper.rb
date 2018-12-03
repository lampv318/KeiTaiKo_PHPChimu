module ApplicationHelper
  def full_title(page_title = '')
    base_title = "KeitaiKo"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def price_review(price)
    return number_to_currency(price, precision: 0)
  end
end
