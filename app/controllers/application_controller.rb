
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles' do
     @articles = Article.all
     erb :index
  end

  post '/articles' do
    @title = params[:title]
    @content = params[:content]
    @new_article = Article.create(title: @title, content: @content)
    redirect "/articles/#{@new_article.id}"
  end

  get '/articles/new' do
  erb :new
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end


end
