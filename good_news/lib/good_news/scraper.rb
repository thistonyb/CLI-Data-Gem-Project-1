require_relative "./topic.rb"
require_relative "./article.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    # A constant to store the homepage.
    HOMEPAGEURL = "https://www.goodnewsnetwork.org/category/news/"

    #Uses open-uri and nokogiri to grab and parse the HTML.
    #Returns the parsed page in a array which sets it up for a search using CSS selectors.
    def self.get_page(url)
        return Nokogiri::HTML(open(url))
    end
    #Uses Class method #get_page and saves to doc. 
    #Uses a css selector to loop through a section of the document that contains topic info.
    #Instantiates a Topic object and stores the topic name in the Topic object's name attribute and 
    #stores the topic web address in the Topic object's web_addr attribute.
    #Saves each Topic object in the Topic Class variable @@all using the #save method.
    def self.get_topics
        doc = self.get_page(HOMEPAGEURL)
        doc.css("ul.td-category a").each do |topic|
            new_topic = Topic.new
            new_topic.name = topic.text
            new_topic.web_addr = topic.attribute("href").value
            new_topic.save
        end
    end

    def self.get_articles
        Topic.all.each do |topic|
            doc = self.get_page(topic.web_addr)
            doc.css("h3.entry-title td-module-title a").each do |info| 
                new_article = Article.new
                new_article.web_addr = info.attribute("href").value
                new_article.title = info.text
                topic.articles.push(new_article) 
            end
        end
    end

end

