class Printer

   def to_screen(history)
    statement = "date || credit || debit || balance"
    history.reverse_each do |transaction|
      statement << "\n"
      transaction.each do |key, _value|
        statement << "#{transaction[key]} || "
      end
    end
    statement
  end
 end
