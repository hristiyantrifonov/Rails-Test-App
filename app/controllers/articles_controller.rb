class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  # The create method for submission details go into the params hash
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end