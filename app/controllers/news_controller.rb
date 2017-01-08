class NewsController < ApplicationController
  def index
    render locals: { news: all_news.ordered.decorate }
  end

  def show
    render locals: { news: news.decorate }
  end

  def new
    render locals: { news: News.new }
  end

  def create
    news = News.new(news_params)

    if news.save
      redirect_to news_index_path, notice: t('notifications.created')
    else
      render :new, locals: { news: news }
    end
  end

  def edit
    render locals: { news: news }
  end

  def update
    if news.update(news_params)
      redirect_to news_index_path, notice: t('notifications.updated')
    else
      render :new, locals: { news: news }
    end
  end

  def destroy
    news.destroy!
    redirect_to news_index_path, notice: t('notifications.destroyed')
  end

  private

  def news
    return @_news if defined?(@_news)
    @_news = News.find(params[:id])
  end

  def all_news
    return @_all_news if defined?(@_all_news)
    @_all_news = News.all
  end

  def news_params
  end
end
