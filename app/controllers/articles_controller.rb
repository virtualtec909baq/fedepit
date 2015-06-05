class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end
  def show
  	@article = Article.find(params[:id])
  	@articles = Article.last(4).reverse	

  end
end
