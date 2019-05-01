require_relative "./scraper.rb"
require_relative "./article.rb"
require_relative "./cli.rb"


class Topic
    attr_accessor :name, :articles, :web_addr

    #Class variable stores all topics objects.
    @@all = []

    #Instantiates with an article attribute to store all articles of the topic.
    def initialize
        @articles = []
    end

    #Class method to get all topics.
    def self.all
        @@all
    end

    #Method to save topic object into @@all.
    def save
        @@all << self
    end
end