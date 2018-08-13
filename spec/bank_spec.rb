require 'bank'

# user story 1
# as a customer
# so i can store money in my bank-account
# i want to deposit money in my bank-account and added to the balance

describe Bank do

  subject(:bank) { Bank.new }

  describe '#deposit' do
    it 'should add money to the balance' do
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      bank.deposit(1000, date)
      expect(bank.balance).to eq(1000)
    end

    it 'stores the date when action is proceed' do
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      bank.deposit(1000, date)
      expect(bank.print_statement).to eq("date || credit || debit || balance
       13/08/2018 || 1000 ||
       || 1000")
    end

  end
end
