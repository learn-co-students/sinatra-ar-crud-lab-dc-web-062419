require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :show_exceptions => false
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

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find[id]
    erb :show
  end



  # post '/articles' do
  # end
end
