class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? #taken from bank account
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? == false || self.sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    unless self.status == "complete"

      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      #can only happen once
    end

  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
