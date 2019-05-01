class GoodNews::Scraper
    # A constant to store the homepage.
    HOMEPAGEURL = "https://www.goodnewsnetwork.org/category/news/"

    #Uses open-uri and nokogiri to grab and parse the HTML.
    #Returns the parsed page in a array which sets it up for a search using CSS selectors.
    def self.get_page(url)
        return Nokogiri::HTML(open(url))
    end

    #This method grabs Topics and stores them. Uses Class method #get_page and saves to doc. 
    #Instantiates a Topic object and stores the topic name and web address in the Topic object.
    #Saves each Topic object in the Topic Class variable @@all using the #save method.
    def self.get_topics
        doc = self.get_page(HOMEPAGEURL)
        doc.css("ul.td-category a").each do |topic|
            new_topic = GoodNews::Topic.new
            new_topic.name = topic.text
            new_topic.web_addr = topic.attribute("href").value
            new_topic.save
        end
    end
    
    #This method is used to get and store each topic's articles.
    #Calls Topic's @@all Class variable array to loop through Topic objects.
    #Instantiates new Article object. Saves article's web address and title to Article object.
    #Pushes Article object into the Topic object's articles attribute(an array).
    def self.get_articles
        GoodNews::Topic.all.each do |topic|
            doc = self.get_page(topic.web_addr)
            doc.css("h3.entry-title a").each do |info| 
                new_article = GoodNews::Article.new
                new_article.web_addr = info.attribute("href").value
                new_article.title = info.text
                topic.articles.push(new_article) 
            end
        end
    end
end

