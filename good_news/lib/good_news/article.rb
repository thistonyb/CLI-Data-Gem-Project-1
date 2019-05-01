require_relative "./scraper.rb"
require_relative "./topic.rb"
require_relative "./cli.rb"

#Class used to create objects to store article titles and web addresses.
class Article
    attr_accessor :title, :web_addr 
end