class HomesController < ApplicationController

  def index
    @page     = Page.published.first
    @sections = @page.sections
  end

end
