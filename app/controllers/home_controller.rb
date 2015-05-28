class HomeController < ApplicationController
  def index
  	@sponsors = Sponsor.last(5).reverse
  	@articles = Article.last(3).reverse	
  	@canines = Canine.last(4).reverse

  end
  def contactus
  end

end
