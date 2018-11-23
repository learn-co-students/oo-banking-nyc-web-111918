class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  def sender_broke?
    self.sender.balance < amount
  end

  def execute_transaction
    while self.status == "pending"
      if valid? && !sender_broke?
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
        #need explicit return or nil is returned?
      end
    end
  end

  def reverse_transfer
    #it can only occur after a successful transfer
    if self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end

end
