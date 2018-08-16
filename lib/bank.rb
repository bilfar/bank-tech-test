require 'date'
require_relative 'printer'

class Bank

  attr_accessor :balance

  def initialize(printer = Printer.new)
    @printer = printer
    @balance = 0
    @history = []
  end

  def deposit(num, date = Time.now.strftime("%d/%m/%Y"))
    raise "amount is a negative number" if num < 0
    @balance += num
    @history << ({ date: date, credit: num, debit: "",
      balance: @balance })
  end

  def withdraw(num, date = Time.now.strftime("%d/%m/%Y"))
    raise "not enough money on you balance" if num > @balance
    @balance -= num
    @history <<({ date: date, credit: "", debit: num,
      balance: @balance })
  end

  def print_statement
    @printer.to_screen(@history)
  end

end
