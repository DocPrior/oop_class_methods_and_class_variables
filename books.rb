class Book

  @@on_shelf = []

  @@on_loan = []

  attr_accessor :due_date
  def initialize

  end

  def borrow

  end

  def return_to_library

  end

  def lent_out?

  end

  def self.create

  end

  def self.current_due_date

  end

  def self.overdue_books

  end

  def self.browse

  end

  def self.available

  end

  def self.borrowed

  end
end
