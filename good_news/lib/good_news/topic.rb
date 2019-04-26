require_relative "./scraper.rb"
require_relative "./article.rb"

class Topic
    attr_accessor :name, :articles, :web_addr
    @@all = []

    def initialize
        @articles = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end


end