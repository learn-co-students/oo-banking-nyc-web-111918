class BankAccount

  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrow(amount)
    @balance -= amount
  end

  def valid?
    (@status == "open") && (@balance > 0)
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    @status = "closed"
  end

end
