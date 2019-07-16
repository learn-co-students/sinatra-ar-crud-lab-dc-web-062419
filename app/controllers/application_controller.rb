
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/articles' do 
    @articles = Article.all
    erb :index
  end
  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do 
    erb :new
  end
  post '/articles' do 
    x = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{x.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    x = @article.update(title: params[:title], content: params[:content])
    
    redirect "/articles/#{@article.id}"
  end
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    redirect '/'
  end

end
