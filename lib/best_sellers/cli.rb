#Our CLI controller, user interaction and input, etc


class BestSellers::CLI

  def call
    puts "Welcome to The New York Times Best Sellers List for Trade Paperback Fiction"
    list_books
    menu
    goodbye
  end

  def list_books
    puts "The NYTimes List:"
    @books = BestSellers::Book.today
    # binding.pry
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
  end

  def menu

    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like more info on or type list to see the books again or or type exit:"
    input = gets.strip.downcase

    if input.to_i > 0 #string to integer is always 0
      the_book = @books[input.to_i - 1]
      puts "#{the_book.title} by #{the_book.author}"
    elsif input.to_i == "list"
      list_books
    else
        puts "Please type list or exit"
    end
    end
  end

  def goodbye
    puts "Byeeeee"
  end

end
