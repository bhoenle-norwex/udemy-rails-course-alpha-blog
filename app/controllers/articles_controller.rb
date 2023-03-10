class ArticlesController < ApplicationController
  before_action :set_article, only: [ :destroy, :edit, :show, :update ]

  def create
    @article = Article.new(article_params)
    # Temporarily setting the user to continue building the app
    @article.user = User.first
    #render plain: @article.inspect
    if @article.save
      flash[:success] = "Article was successfully saved"

      #redirect_to article_path(@article) or
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy()
    redirect_to articles_path
  end

  def edit
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      #redirect_to article_path(@article) or
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

    def article_params
      params.require(:article).permit( :title, :description)
    end
    def set_article
      @article = Article.find(params[:id])
    end

end
