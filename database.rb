# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require classes
require './models/user.rb'
require './models/post.rb'



# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'


# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/lotr.db'
)




binding.pry