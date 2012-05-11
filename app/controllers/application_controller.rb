class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_up_path_for(resource)
  	fill_address_path
  end
  def fill_address
	#scraper = Scraper.new(cep)
	redirect_to root_path
  end
end
