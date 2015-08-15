module ApplicationHelper

  def partial(page)
    page.title.parameterize.underscore
  end
end
