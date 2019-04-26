require_relative "./topic.rb"
require_relative "./article.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    HOMEPAGEURL = "https://www.goodnewsnetwork.org/category/news/"

    def self.get_page(url)
        return Nokogiri::HTML(open(url))
    end

    def self.get_topics
        doc = self.get_page(HOMEPAGEURL)
        doc.css("ul.td-category a").each do |topic|
            new_topic = Topic.new
            new_topic.name = topic.text
            new_topic.web_addr = topic.attribute("href").value
            new_topic.save
        end
    end

end

