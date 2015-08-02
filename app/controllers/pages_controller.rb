class PagesController < ApplicationController

  def home
    @page = HomePage.published
    @sections = @page.sections
  end
end