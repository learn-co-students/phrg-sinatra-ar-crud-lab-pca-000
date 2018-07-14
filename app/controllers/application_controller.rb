
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do  # Create
    erb :new
  end

  post '/posts' do
    @new_post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
    # erb :posts
  end

  get '/posts' do  # Read
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do  # Update
    @post = Post.find_by(id: params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    # @post = Post.find_by(id: params[:id])
    # binding.pry
    @post = Post.update(params[:id], name: params[:name], content: params[:content])
# binding.pry
    # redirect '/posts/:id'
    erb :show
  end

  delete '/posts/:id/delete' do  # Delete
    # binding.pry
    Post.delete(params[:id])
    erb :delete
  end

end
