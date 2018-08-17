require 'bank'

describe '#statement' do

  subject(:bank) { Bank.new }
  subject(:transaction) { Transaction.new }
  subject(:printer) { Printer.new }

  it 'should show a list of date-action, credit, debit and balance' do
    date1 = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
    date2 = Time.new(2018, 8, 14).strftime("%d/%m/%Y")

    bank.deposit(3000, date1)
    bank.withdraw(500, date2)
    expect { bank.print_statement }.to output("date || credit || debit || balance\n14/08/2018 ||  || 500 || 2500\n13/08/2018 || 3000 ||  || 3000\n").to_stdout
  end
end
