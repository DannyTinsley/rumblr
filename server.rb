require 'sinatra'
require "sinatra/reloader"

register Sinatra::Reloader

get '/' do
 if session[:user_id]
    @user = User.find(session[:user_id])
     erb :loggedin, :layout =>  :layout
    else
    erb :not_allowed
    end
end

get '/about' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :about, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/gallery' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :gallery, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/books' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :books, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/post' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :post, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/signout' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :signout, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/store' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :store, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

get '/signup' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :loggedin, :layout =>  :layout
       else
       erb :signup
       end
   end

get '/loggedin' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :loggedin, :layout =>  :layout
       else
       erb :not_allowed
       end
   end


 get '/not_allowed' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :home, :layout =>  :layout
       else
       erb :not_allowed
       end
   end
# get '/about' do
#   erb :about, :layout =>  :layout
# end

# get '/gallery' do
#   erb :gallery, :layout =>  :layout
# end

# get '/books' do
#     erb :books, :layout =>  :layout
#   end

# get '/post' do
#     erb :post, :layout =>  :layout
#   end

#   get '/signout' do
#     erb :signout, :layout =>  :layout
#   end

#   get '/store' do
#     erb :store, :layout =>  :layout
#   end

#   get '/loggedin' do
#     erb :loggedin, :layout =>  :layout
#   end

post '/' do
#   puts params
#   @message = params["message"]
#   @username = params["username"]
  erb :home, :layout =>  :layout
end