require 'date'

class Printer
  def to_screen(transactions)
  puts "date || credit || debit || balance" + "\n" +

  transactions.reverse.map { |transaction|
      format(transaction)
    }.join("\n")
  end

  private



  def format(transaction)
    [
      transaction[:date],
      transaction[:credit],
      transaction[:debit],
      transaction[:balance]
    ].join(' || ')
  end
end
