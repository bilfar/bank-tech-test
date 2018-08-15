require 'date'
require 'transaction'
require 'printer'

class Bank

  attr_accessor :balance, :transaction

  def initialize(transaction = Transaction.new, printer = Printer.new)
    @transaction = transaction
    @printer = printer
    @balance = 0
  end

  def deposit(num, date = Time.now.strftime("%d/%m/%Y"))
    @balance += num
    @transaction.add_transaction({ date: date, credit: num, debit: "",
      balance: @balance })
  end

  def withdraw(num, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= num
    @transaction.add_transaction({ date: date, credit: "", debit: num,
      balance: @balance })
  end

  def print_statement
    @printer.to_screen(@transaction.history)
  end
end
