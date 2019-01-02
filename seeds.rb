
# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require classes
# require './models/cake.rb'
require './models/user.rb'
require './models/posts.rb'
require './models/sale.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(
    ENV['DATABASE_URL']
   )
else
ActiveRecord::Base.establish_connection(
 adapter: 'sqlite3',
 database: 'db/lotr.db'
)
end


User.foreach('User') do |row|
  puts row.inspect
  if row[0] != "id"
    # extract user Data
    username = row[1]
    email = row[2]
    password = row[3]

    # make user record
    user_signedUp = User.create(

        username: username
        email: email
        password: password
    )
    # extract post Data

    # make a post record
    posts_instance = Posts.create(
      username: row[4],
      title: row[5],
      date: row[6],
      body: row[7],

    )
    # make a Transaction with both
    Sale.create(car: car_instance, customer: customer_instance)
  end
end