class ArticlesController < ApplicationController
  def index
  @articles = Article.all
  end

  def show
  @articles = Article.find(params[:id])
  end

  def new
  @article = Article.new
  end

  def create
  @article = Article.new(article_params)  # this is unique to create and update functions
  @article.save
  redirect_to article_path(@article)
  end

  def edit
  @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])
  @article.update(article_params)  # this is unique to update and create functions
  redirect_to article_path(@article)

  end

  def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path
  end


  private

  def article_params
  params.require(:article).permit(:title,:content) #we use for authorization reaspon and security. these attributes can not be changed by the user. this is importnat for the two functions creat ; update
  end
end
