class BankAccount
  # code here
  attr_accessor :bank_account, :balance, :status
  attr_reader :name
  def initialize(balance = 1000, status = "open", name)
    @name = name
    @balance = balance
    @status = status
    end
    def deposit(money)
        @balance += money
    end
    def display_balance
       return "Your Balance is $#{@balance}." 
    end
    def valid?()
        if @balance > 0 and @status == "open"
            return true
        else
            return false
        end
    end
    def close_account()
        @status = "closed"
    end
end
