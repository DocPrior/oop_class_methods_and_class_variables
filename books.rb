class Book

  @@on_shelf = []

  @@on_loan = []

  attr_accessor :due_date
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow(book)
    lent_out?(book)
    if lent_out?(book) == true
      return false
    end
    current_due_date = @due_date
    @@on_loan << self
    return true
  end

  def return_to_library(book)
    lent_out?(book)
    if lent_out?(book) == false
      return false
    end
    @@on_shelf << self
    return true
  end

  def lent_out?(book)
    @@on_loan.include?(book)
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.current_due_date
    due_date = (Time.now + 60 * 60 * 24 * 10)
  end

  def self.overdue_books
    over_due = []
    @@on_loan.each do |book|
      if @due_date < Time.now
      over_due << self
    end
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end
end
