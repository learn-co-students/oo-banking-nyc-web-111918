class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if  @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    unless @status == "complete"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
