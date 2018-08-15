class Transaction
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(transaction)
    @history.push(transaction)
  end

end
