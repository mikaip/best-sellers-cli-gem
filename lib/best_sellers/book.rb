class BestSellers::Book

  attr_accessor :title, :author, :published_date

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
    self.scrape_books
  end

  def self.scrape_books
    books = []

    books << self.scrape_nytimes


    books
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
    binding.pry

  end

end
