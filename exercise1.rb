class BankAccount

  @@interest_rate = 0.05

  @@accounts = []


  attr_accessor :balance
  def initialize
    @balance = 0
  end

  def deposit(num)
    @balance += num
  end

  def withdraw(num)
    @balance -= num
  end

  def self.create
    BankAccount.new
    @@accounts
  end

  def self.total_funds
    @@accounts.sum
  end

  def self.interest_time
    @@accounts.each do |num|
        num = (@balance * @@interest_rate) + @balance
    end
    return num
  end
end


my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance
puts BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds
BankAccount.interest_time
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds
my_account.withdraw(50)
puts my_account.balance
puts BankAccount.total_funds
