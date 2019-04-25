require 'nokogiri'
require 'pry'


class Scraper

    def get_page
        doc = Nokogiri::HTML(open\("https://www.goodnewsnetwork.org/category/news/"))
    end



end

