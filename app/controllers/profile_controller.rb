class ProfileController < ApplicationController
  include ProfileHelper

  before_action :authenticate_user!

  def index
    @profile = profile_data_json(current_user)
  end
end
