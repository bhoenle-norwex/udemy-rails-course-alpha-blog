class ArticlesController < ApplicationController

  def create
    @article = Article.new(params.require(:article).permit(:title,
                                                           :description))
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was successfully saved"

      #redirect_to article_path(@article) or
      redirect_to @article
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

end
