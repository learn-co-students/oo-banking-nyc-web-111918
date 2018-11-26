class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  @@all = []
  def initialize(sender, receiver, amount, status = 'pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@all << self
  end

  def self.all
    @@all
  end


  def valid?
    if receiver.valid? && sender.valid?
      return true
    end
  end

  def execute_transaction
    if valid? == false || self.amount > sender.balance
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif self.status != 'complete'
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = 'complete'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end

end
