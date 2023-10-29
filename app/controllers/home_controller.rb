class HomeController < ApplicationController
  def index
    @long_format = Article.where(is_longformat: true)
    @actus = Article.where(is_longformat: false)
    @current_date = Date.today
    @long_format_day = Article.where(created_at: @current_date.beginning_of_day..@current_date.end_of_day, is_longformat: true).first
    @actus_day = Article.where(created_at: @current_date.beginning_of_day..@current_date.end_of_day, is_longformat: false)
  end
end
