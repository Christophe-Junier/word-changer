class HomeController < ApplicationController
  def index
    @text = Text.last
  end
end
