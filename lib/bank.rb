require 'date'
class Bank
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
    @history = []
  end

  def deposit(num, date = Time.now.strftime("%d/%m/%Y"))
    @balance += num
    transaction = { date: date, credit: num, debit: "", balance: @balance }
    @history << transaction
  end

  def print_statement
    @history.each do |transaction|
      return "date || credit || debit || balance
       #{transaction[:date]} || #{transaction[:credit]} ||
       || #{transaction[:balance]}"
    end
  end
end
