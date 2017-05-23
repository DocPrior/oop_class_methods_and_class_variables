class Book

  @@on_shelf = []

  @@on_loan = []



  attr_accessor :due_date
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow
    lent_out?
    if lent_out? == true
      return false
    end
    @due_date = Book.current_due_date
    @@on_loan << self
    @@on_shelf.delete(self)
    return true
  end

  def return_to_library
    lent_out?
    if lent_out? == false
      return false
    end
    @@on_shelf << self
    @@on_loan.delete(self)
    return true
  end

  def lent_out?
    @@on_loan.include?(self)
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.current_due_date
    Time.now + 60 * 60 * 24 * 10
  end

  def self.overdue_books
    over_due = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        over_due << self
      end
    end
    over_due
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

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")

aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")

if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect

puts Book.available.inspect
puts Book.borrowed.inspect

puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date

puts Book.available.inspect
puts Book.borrowed.inspect

p "=================================="
puts Book.overdue_books.inspect

puts sister_outsider.return_to_library
puts sister_outsider.lent_out?

puts Book.available.inspect
puts Book.borrowed.inspect
