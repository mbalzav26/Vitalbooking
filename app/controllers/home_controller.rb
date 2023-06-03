class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
   @name = current_user.first_name
  end
end
