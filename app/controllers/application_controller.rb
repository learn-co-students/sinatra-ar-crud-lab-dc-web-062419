
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
  
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  # http://127.0.0.1:9393/articles/5
  # params = {
  #   id: 5,
  # }
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


end
