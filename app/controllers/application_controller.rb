
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all 
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:articleid/edit' do
    @article = Article.find(params[:articleid])
    erb :edit
  end

  patch '/articles/:articleid' do
    @article = Article.find(params[:articleid])
    title = params[:title]
    content = params[:content]
    article = Article.update(@article.id, title: title, content: content)
    redirect "/articles/#{@article.id}"
  end


  get '/articles/:articleid' do
   # @article = Article.find_by(id: params[:articleid])
    article = Article.find(params[:articleid])
    @id = article.id
    @title = article.title
    @content = article.content
    erb :show
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:articleid' do
    @article = Article.find(params[:articleid])
    @article.delete
    redirect to '/articles'
  end
end
