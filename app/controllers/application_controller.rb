
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  set :method_override, true 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do 
    @articles = Article.all 
    erb :index
  end 
  
  post '/articles' do
    title = params["title"]
    content = params["content"]
    article = Article.create(title: title, content: content)
    redirect "/articles/#{article.id}"
  end


  get '/articles/:id' do 
    id = params["id"]
    @article = Article.find(id)
    erb :show
  end 
##############################################################
  get '/articles/:id/edit' do 
    id = params["id"]
    @article = Article.find(id)
    erb :edit 
  end 

  patch '/articles/:id' do 
    @article = Article.find(params["id"])
    id = params["id"]
    content = params["content"]
    title = params["title"]

    @article.update(title: title, content: content)
    redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    Article.delete(params["id"])
    
    redirect '/articles'
  end 
    
    


end
