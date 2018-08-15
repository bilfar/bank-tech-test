require 'transaction'
describe Transaction do
  subject(:transaction) { Transaction.new }
  let(:date) { Time.new(2018, 8, 14).strftime("%d/%m%Y") }

  it "saves a transaction to the history when deposit is made" do
    transaction.add_transaction({ date: date, credit: 1000, debit: "", balance: 1000 })
    expect(transaction.history).to eq [{ date: date, credit: 1000, debit: "", balance: 1000 }]
  end

  it "saves a transaction to the history when withdraw is made" do
    transaction.add_transaction({ date: date, credit: 1000, debit: "", balance: 1000 })
    transaction.add_transaction({ date: date, credit: "", debit: 500, balance: 500 })
    expect(transaction.history).to eq [{ date: date, credit: 1000, debit: "", balance: 1000 }, { date: date, credit: "", debit: 500, balance: 500 }]
  end
end
