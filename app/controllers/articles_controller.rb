class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.includes(:category)
    @categories = Category.all
  end

  def en_360
    # @long_articles = Article.where(is_longformat: true)
    @q = Article.where(is_longformat: true).ransack(params[:q])
    @long_articles = @q.result(distinct: true)
    @categories = Category.all
  end

  def actus
    # @info_articles = Article.where(is_longformat: false)
    @q = Article.where(is_longformat: false).ransack(params[:q])
    @info_articles = @q.result(distinct: true)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @related_articles = Article.where(category: @article.category).where.not(id: @article.id)
    @recommended_articles = []
    @comments = @article.comments
    if current_user
      current_user.update_consecutive_days
    end

    visited_articles = cookies[:visited_articles].to_s.split(",")
    if visited_articles.include?(@article.id.to_s)
    else
      current_reading_mood = cookies[:cookie_reading_mood].to_i || 0
      current_reading_mood += @article.mood_value


      if current_reading_mood >= 5
        @recommended_articles = Article.where(mood_value: -2..0).where.not(id: @article.id)
      end

      cookies[:cookie_reading_mood] = {
        value: current_reading_mood,
        expires: Time.current.end_of_day,
      }
      visited_articles.append(@article.id)
      cookies[:visited_articles] = {
        value: visited_articles.join(","),
        expires: Time.current.end_of_day,
      }
    end
  end

  def add_to_favorites
    article = Article.find(params[:id])
    unless current_user.favorites.exists?(article: article)
      current_user.favorites.create(article: article)
    end
    redirect_to article, notice: "L'article a été ajouté à vos favoris."
  end

  def remove_from_favorites
    article = Article.find(params[:id])
    favorite_article = current_user.favorites.find_by(article: article)
    favorite_article.destroy if favorite_article
    redirect_to article, notice: "L'article a été retiré de vos favoris."
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :lead, :thumbnail, :text_content, :media, :mood_value, :keywords, :is_longformat, :is_draft)
    end
end
