class WelcomeController < ApplicationController
  def index
    flash[:notice] = "welcome to job-listing"
  end

end
