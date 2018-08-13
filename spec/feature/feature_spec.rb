require 'bank'
# as a customer
# so i can track my spendings
# i want to print a statement that shows
# me the date of action, credit, debit and balance.

describe '#statement' do
  subject(:bank) { Bank.new }

  it 'should show a list of date-action, credit, debit and balance' do
    date1 = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
    date2 = Time.new(2018, 8, 14).strftime("%d/%m/%Y")

    bank.deposit(3000, date1)
    bank.withdraw(500, date2)
    expect(bank.print_statement).to eq("date || credit || debit || balance\n14/08/2018 ||  || 500 || 2500 || \n13/08/2018 || 3000 ||  || 3000 || ")
  end
end
