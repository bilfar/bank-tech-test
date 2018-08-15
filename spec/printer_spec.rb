
require 'printer'

describe Printer do

  let(:printer) { Printer.new }
  let(:date) { Time.new(2018, 8, 14).strftime("%d/%m/%Y") }

  describe 'to_screen' do
    it 'should print a formated statement' do
      history = [{ date: date, credit: 3000, debit: "", balance: 3000 }, { date: date, credit: "", debit: 500, balance: 2500 }]
      expect(printer.to_screen(history)).to eq %Q(date || credit || debit || balance\n14/08/2018 ||  || 500 || 2500 || \n14/08/2018 || 3000 ||  || 3000 || )
    end
  end
end
