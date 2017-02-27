require 'pry'
class BestSellers::Book

  attr_accessor :title, :author, :published_date, :price
  @@all = []

  def initialize
    @title = title
    @author = author
    @published_date = published_date
    @price = price

  end

  def self.all
    @@all
  end

  def save  #an instance of itself
    @@all << self
  end

  def self.find(id)  #finding an instance by index
    self.all[id.to_i - 1]
 #   error was: /home/pkim2320-24516/code/labs/best_sellers/lib/best_sellers/book.rb:22:in `find': undefined method `-'
 # for "3":String (NoMethodError)
  end

  def self.doc
    @@doc ||= Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
  end

  # def self.today
  #
  #   #I should return list of books with properties
  #
  #   #scrape site and return books
  #   doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
  #
  # Would Extract the properties of the book, instantiate a book, then return an array of the books
  #   book_1 = self.new
  #     book_1.title = doc.search("p.product-info-title a")[0].text
  #     book_1.author = doc.css("span.contributors a")[0].text.strip
  #     book_1.published_date = doc.css("span.publ-date")[0].text.gsub("(", "").gsub(")", "").strip
  #
  #     book_2 = self.new
  #       book_2.title = doc.search("p.product-info-title a")[1].text
  #       book_2.author = doc.css("span.contributors a")[1].text.strip
  #       book_2.published_date = doc.css("span.publ-date")[1].text.gsub("(", "").gsub(")", "").strip
  #
  #     book_3 = self.new
  #       book_3.title = doc.search("p.product-info-title a")[2].text
  #       book_3.author = doc.css("span.contributors a")[2].text.strip
  #         book_3.published_date = doc.css("span.publ-date")[2].text.gsub("(", "").gsub(")", "").strip
  #
  #       [book_1, book_2, book_3]
  # end



# CLass methods

def self.book_titles
  @@book_titles = doc.search("p.product-info-title a").collect{|e| e.text}
  # using collect - end up with an array of text and not elements
end

def self.book_authors
  @@book_authors = doc.search("span.contributors a").collect{|e| e.text}
end

def self.published_dates
  @@published_dates = doc.css("span.publ-date").collect{|e| e.text.gsub("(", "").gsub(")", "").strip}
end

def self.book_prices
  @@book_prices = doc.search("span.price a").collect{|e| e.text}
end



# This is from following the "Rebuilding Concert Gem" video AND "best restaurants" example
# Get data, Iterate over the data, Create book objects
def self.scrape_all
  (0..9).each do |i|
    book_title = book_titles[i]
    book_author = book_authors[i]
    published_date = published_dates[i]
    book_price = book_prices[i]


# instance variables
# assigning to properties
    book = BestSellers::Book.new
    book.title = book_title
    book.author = book_author
    book.published_date = published_date
    book.price = book_price
    book.save
  end

  binding.pry
end

end
