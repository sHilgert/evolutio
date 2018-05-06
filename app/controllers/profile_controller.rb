class ProfileController < ApplicationController
  include ProfileHelper

  before_action :authenticate_user!

  def index
    user = if params[:user_id]
      User.where(id: params[:user_id]).first
    end || current_user
    @profile = profile_data_json(user)
  end
end
