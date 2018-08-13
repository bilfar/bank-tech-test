require 'bank'

# user story 1
# as a customer
# so i can store money in my bank-account
# i want to deposit money in my bank-account and see my balance.

describe Bank do
  subject(:bank) { Bank.new }
  describe '#deposit' do
    it 'should add money to the balance' do
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
    end
  end
end
