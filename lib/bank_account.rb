class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  @@all = []
  def initialize(name, status = 'open', balance = 1000)
    @name = name
    @status = status
    @balance = balance
    @@all << self
  end

  def self.all
    @@all
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def deposit(amount)
    self.balance += amount
  end

  def valid?
    if self.balance != 0 && self.status != 'closed'
      return true
    else
      return false
    end
  end

  def close_account
    self.status = 'closed'
  end

end
