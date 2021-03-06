# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/
require 'active_record'

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

# Run this script with `bundle exec ruby app.rb`



#require classes
require './models/user.rb'
require './models/post.rb'



# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'


binding.pry