require_relative './lib/good_news/version'


Gem::Specification.new do |spec|
  spec.name          = 'good-news'
  spec.version       = GoodNews::VERSION
  spec.authors       = "Tony Baker"
  spec.email         = 'this.tonybaker@gmail.com'

  spec.summary       = "Good News"
  spec.description   = "Provides good news topics and then articles launched to a browser."
  spec.homepage      = 'http://rubygems.org/gems/good-news'
  spec.license       = "MIT"
  spec.executables << 'good-news'

  spec.files         = ["lib/good_news.rb", "lib/good_news/version.rb", "lib/good_news/cli.rb", "lib/good_news/scraper.rb", "lib/good_news/article.rb", "lib/good_news/topic.rb", "config/environment.rb"]

 
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "launchy", ">= 0"
end
