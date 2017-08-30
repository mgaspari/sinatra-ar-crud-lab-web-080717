require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end


  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  post '/posts' do
      post = Post.new(params)
      post.save
      redirect "/posts"
  end


  patch '/posts/:id' do
    post = Post.find_by(id: params[:id])
    post.update(name: params[:name],content: params[:content])
    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
    post = Post.find_by(id: params[:id])
    post.delete
    "#{post.name} was deleted"
    # redirect "/posts"
  end






end
