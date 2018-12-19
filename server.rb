require 'sinatra'
require "sinatra/reloader"

register Sinatra::Reloader

get '/' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :loggedin, :layout =>  :layout
      else
      erb :home
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
        erb :loggedin, :layout =>  :layout
       
   end


 get '/not_allowed' do
    if session[:user_id]
       @user = User.find(session[:user_id])
        erb :loggedin, :layout =>  :layout
       else
       erb :not_allowed
       end
   end

   get '/signout' do
      session[:user_id] = nil
      redirect '/'
    end



    post '/users/login' do
      user = User.find_by(email: params["email"], password: params["password"])
      puts ">>>>>>>>>>>>"
      puts user.inspect
      puts ">>>>>>>>>>>>"
      if user
        session[:user_id] = user.id
        redirect '/loggedin'
      else
        redirect '/login'
      end
    end
    

    
   #  post '/signup' do
   #    temp_user = User.find_by(email: params["email"])
   #    if temp_user
   #      redirect '/loggedin'
   #    else
   #      user = User.create(userame: params["username"], email: params["email"], password: params["password"])
   #      session[:user_id] = user.id
   #      redirect '/'
   #    end
   #  end

    post '/loggedin' do
      erb :loggedin, :layout =>  :layout
    end

    get '/hobbit_book' do
      if session[:user_id]
         @user = User.find(session[:user_id])
          erb :hobbit_book, :layout =>  :layout
         else
         erb :not_allowed
         end
     end

     get '/fellow_movie' do
      if session[:user_id]
         @user = User.find(session[:user_id])
          erb :fellow_movie, :layout =>  :layout
         else
         erb :not_allowed
         end
     end

     get '/hobbit_movie' do
      if session[:user_id]
         @user = User.find(session[:user_id])
          erb :hobbit_movie, :layout =>  :layout
         else
         erb :not_allowed
         end
     end
   
     get '/return_movie' do
      if session[:user_id]
         @user = User.find(session[:user_id])
          erb :return_movie, :layout =>  :layout
         else
         erb :not_allowed
         end
     end
   
     get '/towers_movie' do
      if session[:user_id]
         @user = User.find(session[:user_id])
          erb :towers_movie, :layout =>  :layout
         else
         erb :not_allowed
         end
     end
# remember to add all the links <do method> for the books/movies in the dropdown menu on the navbar
#######

get '/fellowship_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :fellowship_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end


  get '/two_towers_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :two_towers_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end

  get '/return_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :return_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end

  get '/sil_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :sil_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end

  get '/hurin_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :hurin_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end

  get '/fall_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :fall_book, :layout =>  :layout
      else
      erb :not_allowed
      end
  end

  get '/beren_book' do
   if session[:user_id]
      @user = User.find(session[:user_id])
       erb :beren_book, :layout =>  :layout
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