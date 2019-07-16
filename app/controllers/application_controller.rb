# frozen_string_literal: true

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end


  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.delete
    redirect '/'
  end
end
