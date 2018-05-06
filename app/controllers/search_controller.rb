class SearchController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    @users = User.all
  end
end
