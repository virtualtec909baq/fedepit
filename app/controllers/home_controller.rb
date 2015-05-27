class HomeController < ApplicationController
  def index
  	@sponsors = Sponsor.all
  	@articles = Article.last(3).reverse	
  	@canines = Canine.last(4).reverse
  end
  def contactus
  end

end
