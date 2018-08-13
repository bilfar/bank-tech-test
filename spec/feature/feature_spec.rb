require 'bank'
# as a customer
# so i can track my spendings
# i want to print a statement that shows
# me the date of action, credit, debit and balance.

describe '#statement' do
  subject(:bank) { Bank.new }

  it 'should show a list of date-action, credit, debit and balance' do
    bank.deposit(1000)
    bank.deposit(2000)
    bank.withdraw(500)
    expect(bank.statement).to eq('
      date || credit || debit || balance
      14/01/2012 || || 500.00 || 2500.00
      13/01/2012 || 2000.00 || || 3000.00
      10/01/2012 || 1000.00 || || 1000.00
    ')
  end
end
