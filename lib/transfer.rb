class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def execute_transaction
    if @status == "pending" && @sender.valid? && (@sender.balance >= amount)
      @sender.withdrow(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdrow(amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    @status = "closed"
  end
end
