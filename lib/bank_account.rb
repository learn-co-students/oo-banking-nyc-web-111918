class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  # BankAccount
  #   #initialize
  #     can initialize a Bank Account (FAILED - 1)
  #     initializes with a name (FAILED - 2)
  #     always initializes with balance of 1000 (FAILED - 3)
  #     always initializes with a status of 'open' (FAILED - 4)
  #     can't change its name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  #   #deposit
  #     can deposit money into its account (FAILED - 5)

  def deposit(amount)
    @balance += amount
  end

  #   #display_balance
  #     can display its balance (FAILED - 6)

  def display_balance
    "Your balance is $#{balance}."
  end

  #   #valid?
  #     is valid with an open status and a balance greater than 0 (FAILED - 7)

  def valid?
    if @balance > 0 && @status == 'open'
      true
    else false
    end
  end

  #   #close_account
  #     can close its account (FAILED - 8)

  def close_account
    @balance = 0
    @status = 'closed'
  end


end
