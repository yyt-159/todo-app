class HomeController < ApplicationController
  skip_before_action :require_sign_in!
  
  def index
  end
end
