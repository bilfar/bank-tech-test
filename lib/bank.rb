require 'date'
require 'transaction'

class Bank

  attr_accessor :balance, :transaction

  def initialize(transaction = Transaction.new)
    @transaction = transaction
    @balance = 0
  end

  def deposit(num, date = Time.now.strftime("%d/%m/%Y"))
    @balance += num
    @transaction.add_transaction({ date: date, credit: num, debit: "", balance: @balance })
  end

  def withdraw(num, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= num
    @transaction.add_transaction( { date: date, credit: "", debit: num, balance: @balance })
  end

  def print_statement
    statement = "date || credit || debit || balance"
    @transaction.history.reverse_each do |trans|
      statement << "\n"
      trans.each do |key, _value|
        statement << "#{trans[key]} || "
      end
    end
    statement
  end
end
