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

  def withdraw(withdraw_num, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= withdraw_num
    transaction = { date: date, credit: "", debit: withdraw_num, balance: @balance }
    @history << transaction
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @history.reverse_each do |transaction|
      statement << "\n"
        transaction.each do |key, value|
          statement << "#{transaction[key]} || "
        end
      end
    statement
  end
end
