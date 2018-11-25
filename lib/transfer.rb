class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    validity = false
    validity = true if sender.valid? == true && receiver.valid? == true && sender.balance >= amount
    validity
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      self.accept_transfer
    else
      self.reject_transfer
    end
  end

  def accept_transfer
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end 
  end



end
