require 'bank'

describe Bank do

  subject(:bank) { Bank.new(printer) }

  let(:transaction) { double :transaction, :history => [] }
  let(:printer) { double :printer }

  describe '#deposit' do
    it 'should add money to the balance when made a deposit' do
      allow(transaction).to receive(:add_transaction)
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      bank.deposit(1000, date)
      expect(bank.balance).to eq(1000)
    end

    it "should give error message if amount lower then 0" do
      allow(transaction).to receive(:add_transaction)
      date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
      expect{bank.deposit(-100, date)}.to raise_error "amount is a negative number"
    end

    describe '#withdraw' do
      it 'should take money from the balance when a withdraw is made' do
        allow(transaction).to receive(:add_transaction)
        date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
        bank.deposit(3000, date)
        bank.withdraw(500, date)
        expect(bank.balance).to eq(2500)
      end

      it "should give error message if amount higher then you balance" do
        allow(transaction).to receive(:add_transaction)
        date = Time.new(2018, 8, 13).strftime("%d/%m/%Y")
        bank.deposit(1000, date)
        expect{bank.withdraw(2000, date)}.to raise_error "not enough money on you balance"
      end

      it 'should print a bank-statement' do
        allow(printer).to receive(:to_screen).and_return(%Q(date || credit || debit || balance\n14/08/2018 ||  || 1000 || 1000 || \n14/08/2018 || 2000 ||  || 2000 || ))
        expect(bank.print_statement).to eq %Q(date || credit || debit || balance\n14/08/2018 ||  || 1000 || 1000 || \n14/08/2018 || 2000 ||  || 2000 || )
      end
    end
  end
end
