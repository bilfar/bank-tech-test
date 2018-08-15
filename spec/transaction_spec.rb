require 'transaction'
 describe Transaction do
   subject(:transaction) { Transaction.new }
   it "saves a transaction to the history" do
    transaction.add_transaction({ date: 14 / 10 / 2018, credit: 1000, debit: "", balance: 1000 })
    expect(transaction.history).to eq [{ date: 14 / 10 / 2018, credit: 1000, debit: "", balance: 1000 }]
  end
end
