#Our CLI controller, responsible for user interaction and input, etc


class BestSellers::CLI

  def call  # defining the methods i want to call
    BestSellers::Book.scrape_all #prime the class, to have all instances of book reDY
    puts "Welcome to The New York Times Best Sellers List"
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Here are the top ten books in Trade Paperback Fiction. Which book would you like to learn more information about?"  #Should also try asking user to choose between different categories/lists

    BestSellers::Book.all.each.with_index(1) do |book, i|  #each.with_index - passing in the indext to start at
      puts "#{i}. #{book.title} by #{book.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the book for more details, or type list to see the books again or type exit:"
    input = gets.strip.downcase

    if input.to_i.between?(1, BestSellers::Book.all.size) #string to integer is always 0 -> "hi".to_i is 0; "5".to_i is 5 ; so if bigger than zero, treat it as an integer
      the_book = BestSellers::Book.find(input)
      puts "Title: #{the_book.title}"
      puts "Author: #{the_book.author}"
      puts "Date Published: #{the_book.published_date}"
      puts "Price: #{the_book.price}"
    elsif input == "list"
      list_books
    else  #in case they enter anything else
        puts "Please type list or exit"
    end
    end
  end

  def goodbye
    puts "Goodbye!"
  end

end
