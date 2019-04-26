require_relative "./topic.rb"
require_relative "./article.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

    def get_page
        doc = Nokogiri::HTML(open("https://www.goodnewsnetwork.org/category/news/"))
        binding.pry
    end

    def get_topics

    end

end

