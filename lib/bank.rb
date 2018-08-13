class Bank
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(num)
    @balance += num
  end
end
