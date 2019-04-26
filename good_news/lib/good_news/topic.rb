require_relative "./scraper.rb"
require_relative "./article.rb"

class Topic
    attr_accessor :name, :articles
    @@all = []

    def initialize
        @articles = []
    end

    def self.all
        @@all
    end


end