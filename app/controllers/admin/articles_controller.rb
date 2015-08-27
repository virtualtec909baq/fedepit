class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @search = Article.ransack(params[:q])
    @articles = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @article = Article.new()
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comments = @article.comments.order(created_at: :desc).page(params[:page])
    @articles = Article.last(4).reverse 
  end

  # GET /articles/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Articulo creado'
        format.html { redirect_to new_admin_paragraph_path(article_id: @article.id) }
        format.js { js_redirect_to(new_admin_paragraph_path(article_id: @article.id))}
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        flash[:notice] = 'Articulo modificado'
        format.html { redirect_to admin_article_path(@article) }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      flash[:notice] = 'Articulo eliminado'
      format.html { redirect_to admin_articles_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :img)
    end
end
