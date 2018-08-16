require 'date'
require_relative 'transaction'
require_relative 'printer'

class Bank

  attr_accessor :balance, :transaction

  def initialize(transaction = Transaction.new, printer = Printer.new)
    @transaction = transaction
    @printer = printer
    @balance = 0
  end

  def deposit(num, date = Time.now.strftime("%d/%m/%Y"))
    raise "amount is a negative number" if num < 0
    @balance += num
    @transaction.add_transaction({ date: date, credit: num, debit: "",
      balance: @balance })
  end

  def withdraw(num, date = Time.now.strftime("%d/%m/%Y"))
    raise "not enough money on you balance" if num > @balance
    @balance -= num
    @transaction.add_transaction({ date: date, credit: "", debit: num,
      balance: @balance })
  end

  def print_statement
    @printer.to_screen(@transaction.history)
  end

end
