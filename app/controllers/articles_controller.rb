class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end
  def show
  	@article = Article.find(params[:id])
  	@articles = Article.last(4).reverse	
    @comments = @article.comments.where(status: true)

  end
   def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(feature_params)

    respond_to do |format|
      if @Comment.save
               flash[:notice] = 'Articulo modificado'
        format.html { redirect_to article_path(@article) }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
end
