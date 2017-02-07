class BestSellers::Book

  attr_accessor :title, :author, :published_date
  @@all = []

  def initialize
    @title = title
    @author = author
    @published_date = published_date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.today
    #I should return list of books
    # puts <<-DOC
    # 1. A Dog's Purpose
    # 2. A Man Called Ove
    # DOC

    # book_1 = self.new
    # book_1.title = "A Dog's Purpose"
    # book_1.author = "W. Bruce Cameron"
    # book_1.weeks_on_list = "8"
    #
    # book_2 = self.new
    # book_2.title = "A Man Called Ove"
    # book_2.author = "Fredrik Backman"
    # book_2.weeks_on_list = "36"
    #
    # [book_1, book_2]

    #scrape site and return books
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))

    book_1 = self.new
      book_1.title = doc.search("p.product-info-title a")[0].text
      book_1.author = doc.css("span.contributors a")[0].text.strip
      book_1.published_date = doc.css("span.publ-date")[0].text.gsub("(", "").gsub(")", "").strip

      book_2 = self.new
        book_2.title = doc.search("p.product-info-title a")[1].text
        book_2.author = doc.css("span.contributors a")[1].text.strip
        book_2.published_date = doc.css("span.publ-date")[1].text.gsub("(", "").gsub(")", "").strip

        [book_1, book_2]
    # self.scrape_books
  end

  def self.scrape_books
    books = []

    books << self.scrape_nytimes


    books
  end

#   def self.scrape_nytimes
#
#
# doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
#
# book_1 = self.new
#   book_1.title = doc.search("p.product-info-title a")[0].text
#   book_1.author = doc.css("span.contributors a")[0].text.strip
#   book_1.published_date = doc.css("span.publ-date")[0].text.gsub("(", "").gsub(")", "").strip
#
#   book_2 = self.new
#     book_2.title = doc.search("p.product-info-title a")[1].text
#     book_2.author = doc.css("span.contributors a")[1].text.strip
#     book_2.published_date = doc.css("span.publ-date")[1].text.gsub("(", "").gsub(")", "").strip
#


# doc.css("ul.record").collect do |info|
#   book_info = {
#   :title =>
# }
# book_info
# end



  end

end
