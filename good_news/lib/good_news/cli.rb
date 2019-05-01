require_relative "./scraper.rb"
require_relative "./topic.rb"
require_relative "./article.rb"
require 'nokogiri'
require 'open-uri'
require 'launchy'
require 'pry'

#Command line interface class
class Cli

    #Class method to begin interaction with user.
    #Gives a choice of topics or exit.
    #Calls on #display_topics.
    def self.call_user
        user_input = nil
        while user_input != "exit"
            puts "Welcome, it looks like you are looking for some Good News!"
            puts "To see Good News topics, type 'topics'."
            puts "To quit, type 'exit'."
            puts "Please enter your choice now."

            user_input = gets.downcase.chomp

            case user_input
            when 'topics'
                self.display_topics
            when 'exit'
                self.good_bye
            end
        end
    end

    #Class method to loop through topic objects and display names.
    #Offers user choice of picking a topic to display articles in that topic or exit. 
    #Calls on #display_articles.
    def self.display_topics
        user_input = nil
        counter = 1
        Topic.all.each do |topic|
            puts "#{counter}. #{topic.name}"
            counter += 1
        end
        while user_input != "exit"
            puts "Please enter the number of the topic to see a list of articles."
            puts "Or type 'exit' to quit."
            
            user_input = gets.chomp

            if (1..Topic.all.length).include?(user_input.to_i)
                self.display_articles(user_input)
            elsif user_input == "exit"
                self.good_bye
            end
        end
    end

    #Class method that loops through a topic objects articles attribute, an array of article objects.
    #Offers user a choice of article to pick or to exit.
    #Launches article in browser.
    def self.display_articles(topic_input)
        user_input = nil
        topic_articles = Topic.all[topic_input.to_i - 1].articles
        counter = 1
        topic_articles.each do |article|
            puts "#{counter}. #{article.title}"
            counter += 1
        end
        while user_input != "exit"
            puts "Please enter the number of the article to be taken to its page."
            puts "Or type 'exit' to quit."
            
            user_input = gets.chomp

            if (1..topic_articles.length).include?(user_input.to_i)
                puts "Hold onto your seat, we are sending you to some Good News!"
                Launchy.open(topic_articles[user_input.to_i - 1].web_addr)
            elsif user_input == "exit"
                self.good_bye 
            end
        end
    end

    #Class method to abstract away the exit redundancy.
    def self.good_bye
        puts "See you next time!"
        exit
    end
end