class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  # Transfer
  #   initialize
  #     can initialize a Transfer (FAILED - 9)
  #     initializes with a sender (FAILED - 10)
  #     initializes with a receiver (FAILED - 11)
  #     always initializes with a status of 'pending' (FAILED - 12)
  #     initializes with a transfer amount (FAILED - 13)
  #
  # @@all_transactions = []
  #
  # def self.all
  #   @@all_transactions
  # end

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

#   #valid?
#     can check that both accounts are valid (FAILED - 14)
#     calls on the sender and receiver's #valid? methods (FAILED - 15)

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else false
    end
  end

  #   #execute_transaction
  #     can execute a successful transaction between two accounts (FAILED - 16)
  #     each transfer can only happen once (FAILED - 17)
  #     rejects a transfer if the sender doesn't have a valid account (FAILED - 18)

  def once
    @once ||= self.execute_transaction
  end

  def execute_transaction
    if @status != 'complete'
      if @sender.balance > self.amount
        @sender.balance = @sender.balance - self.amount
        @receiver.balance = @receiver.balance + self.amount
        @status = 'complete'
      else @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  #   #reverse_transfer
  #     can reverse a transfer between two accounts (FAILED - 19)
  #     it can only reverse executed transfers (FAILED - 20)

  def reverse_transfer
    if @status == 'complete'
      @sender.balance = @sender.balance + self.amount
      @receiver.balance = @receiver.balance - self.amount
      @status = 'reversed'
    end
  end


  end
