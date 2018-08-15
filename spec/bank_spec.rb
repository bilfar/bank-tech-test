require 'bank'

describe Bank do

  subject(:bank) { Bank.new(transaction) }
  let(:transaction) { double :transaction, :history => []}

  describe '#deposit' do
    it 'should add money to the balance' do
      allow(transaction).to receive(:add_transaction)
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      bank.deposit(1000, date)
      expect(bank.balance).to eq(1000)
    end

    it 'stores the date when action is proceed' do
      transaction.history.push({date: Time.new(2018, 8, 13).strftime("%d/%m/%Y"), credit: 1000 , debit: "" , balance: 1000})
      expect(bank.print_statement).to eq("date || credit || debit || balance\n13/08/2018 || 1000 ||  || 1000 || ")
    end
  end

  describe '#withdraw' do
    it 'should take money from the balance' do
      allow(transaction).to receive(:add_transaction)
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      bank.deposit(3000, date)
      bank.withdraw(500, date)
      expect(bank.balance).to eq(2500)
    end

    it 'should also print a debit statement' do
      transaction.history.push({date: Time.new(2018, 8, 13).strftime("%d/%m/%Y"),credit: 3000, debit: "", balance: 3000 })
      transaction.history.push({date: Time.new(2018, 8, 13).strftime("%d/%m/%Y"),credit: "", debit: 500, balance: 2500 })
      head = "date || credit || debit || balance"
      transaction_1 = "\n13/08/2018 || 3000 ||  || 3000 || "
      transaction_2 = "\n13/08/2018 ||  || 500 || 2500 || "
      expect(bank.print_statement).to eq("#{head}#{transaction_2}#{transaction_1}")
    end
  end
end
