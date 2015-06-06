class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end
  
  def show
  	@article = Article.find(params[:id])
  	@articles = Article.last(4).reverse	
    @comments = @article.comments.where(status: true)
  end
  
  def denounce
    @comment = Comment.find(params[:comment_id])
    val = @comment.report + 1
    puts val
    @comment.update(:report => val )
    respond_to do |format|
      flash[:notice] = 'Se ha reportado'
      format.html { redirect_to article_path(@comment.article_id)}
    end
  end
end
