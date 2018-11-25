require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender =sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction

    #checks that sender (a BankAccount instance) is valid           must specify status to make sure it only goes through one time
    if self.sender.valid? && self.sender.balance > self.amount && self.status == 'pending'

      self.sender.balance -= self.amount
      self.receiver.balance += self.amount

      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

    if self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end

  end

end
