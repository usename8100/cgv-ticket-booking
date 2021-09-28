class StaticPagesController < ApplicationController
  def home
    @movies = Movie.all
  end

  def not_found
  end

  def internal_server_error
  end
end
