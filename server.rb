require 'sinatra'
require "sinatra/reloader"
require "./models/user.rb"
require "./models/post.rb"
require "active_record"



ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/lotr.db'
)


register Sinatra::Reloader
enable :sessions


def logged_in?
   !!current_user
 end
 
 def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 def user_id
  @user_id ||= session[:user_id] if session[:user_id] 
 end



get '/' do
   erb :home, :layout =>  :layout
end

# post '/' do
#    if 
#       session[:user_id] = !logged_in?
post '/' do
   # user = User.find(username: params["username"], email: params["email"], password: params["password"])
   puts ">>>>>>>>>>>>"
   puts user.inspect
   puts ">>>>>>>>>>>>"
   if 
     session[:user_id] = user.id
     session[:user_id] == !logged_in?
     redirect '/loggedin'
   else
     redirect '/login'
   end
 end

get '/home' do
   if session[:user_id] != nil
      # @user = User.find(session[:user_id])
       redirect '/loggedin'
   else session[:user_id] = nil
      redirect '/'
      end
   end



# get '/about' do
#     if session[:user_id] != nil
#    #    redirect '/about'
#       erb :about, :layout =>  :layout
#        else 
#    session[:user_id] = nil
#    #    #  erb :not_allowed
#    #  else 
#    #    session[:user_id] = nil
#       redirect '/not_allowed'
#        end
#    end

get '/about' do
   if 
      session[:user_id] = !logged_in? 
       erb '/about'
   else
      session[:user_id] != !logged_in?
       redirect '/not_allowed'
   end
 end



# get '/signup' do
#     if session[:user_id]
#        @user = User.find(session[:user_id])
#         erb :loggedin, :layout =>  :layout
#        else
#        erb :signup
#        end
#    end

   

get '/loggedin' do
   erb :loggedin, :layout =>  :layout
      
   end

   post '/loggedin' do
      if 
      session[:user_id] == !logged_in? 
      # Post.create!(user_id: params[:user_id], title:  params[:title], date: params[:date], body: params[:body])
      Post.create(
      user_id: params["user_id"],
      title: params["title"],
      date: params["date"],
      body: params["body"]
   )
      else 
         redirect '/loggedin'
      end
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
      session[:user_id] == nil
      session[:user_id] != !logged_in?
     redirect '/'
     
    end



    get '/login' do
     erb :login, :layout => :layout
    end

   post '/login' do
      # user = User.find_by(username: params["username"], email: params["email"], password: params["password"])
      puts ">>>>>>>>>>>>"
      puts user.inspect
      puts ">>>>>>>>>>>>"
      if 
        session[:user_id] = user.id
        session[:user_id] == !logged_in?
        redirect '/loggedin'
      else
        redirect '/login'
      end
    end
    
    get '/make_post' do
      erb :make_post, :layout => :layout
     end
    
    get '/signup' do
     erb :signup, :layout => :layout
    end
   

post '/signup' do
   puts ">>>>>"
   puts params
   puts ">>>>>"
 
   # make a user record
   User.create(
      username: params["username"],
      email: params["email"],
      password: params["password"]
   )
      session[:user_id] == !logged_in?
   # # make a car record
   # car_instance = Car.create(
   #   make: params["make"],
   #   model: params["model"],
   #   year: params["year"],
   #   sale_markup: params["sale_markup"],
   #   cost_price: params["cost_price"]
   # )
   # # make a Transaction with both
   # Sale.create(car: car_instance, customer: customer_instance)
 
   redirect '/loggedin'
 end


    post '/loggedin' do
      erb :loggedin, :layout =>  :layout
    end


get '/gallery' do
      if 
         session[:user_id] = !logged_in? 
         erb '/gallery'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
   end

get '/books' do
      if 
         session[:user_id] = !logged_in? 
         erb '/books'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
   end

get '/post' do
      if 
         session[:user_id] = !logged_in? 
         erb '/post'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
   end


get '/store' do
      if 
         session[:user_id] = !logged_in? 
         erb '/store'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
   end

    get '/hobbit_book' do
         if 
            session[:user_id] = !logged_in? 
            erb '/hobbit_book'
         else
            session[:user_id] != !logged_in?
            redirect '/not_allowed'
         end
     end

     get '/fellow_movie' do
         if 
            session[:user_id] = !logged_in? 
            erb '/fellow_movie'
         else
            session[:user_id] != !logged_in?
            redirect '/not_allowed'
         end
     end

     get '/hobbit_movie' do
         if 
            session[:user_id] = !logged_in? 
            erb '/hobbit_movie'
         else
            session[:user_id] != !logged_in?
            redirect '/not_allowed'
         end
     end
   
     get '/return_movie' do
         if 
            session[:user_id] = !logged_in? 
            erb '/return_movie'
         else
            session[:user_id] != !logged_in?
            redirect '/not_allowed'
         end
     end
   
     get '/towers_movie' do
         if 
            session[:user_id] = !logged_in? 
            erb '/towers_movie'
         else
            session[:user_id] != !logged_in?
            redirect '/not_allowed'
         end
     end
# remember to add all the links <do method> for the books/movies in the dropdown menu on the navbar
#######

get '/fellowship_book' do
      if 
         session[:user_id] = !logged_in? 
         erb '/fellowship_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
  end


  get '/two_towers_book' do
      if 
         session[:user_id] = !logged_in? 
         erb '/two_towers_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
  end

  get '/return_book' do
      if 
         session[:user_id] = !logged_in? 
         erb '/return_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
  end

  get '/sil_book' do
      if 
         session[:user_id] = !logged_in? 
         erb '/sil_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
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
      if 
         session[:user_id] = !logged_in? 
         erb '/fall_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
  end

  get '/beren_book' do
      if 
         session[:user_id] = !logged_in? 
         erb '/beren_book'
      else
         session[:user_id] != !logged_in?
         redirect '/not_allowed'
      end
  end









# post '/' do
# #   puts params
# #   @message = params["message"]
# #   @username = params["username"]
#   erb :home, :layout =>  :layout
# end