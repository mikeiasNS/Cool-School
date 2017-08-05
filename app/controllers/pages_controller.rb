class PagesController < ApplicationController
  def home
    @units = Unit.all
  end
end
