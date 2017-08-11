require_relative 'bank_account'

class Transfer
  # code here
  attr_accessor :receiver, :amount, :sender, :status
  def initialize(sender, receiver, transferAmount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transferAmount
  end

    def both_valid?
    # || is OR && is AND
      if @sender.valid? && @receiver.valid?
          return true
        else
            return false
      end
    end
    
    def execute_transaction()
        # puts @sender.valid?
        if @status != "complete" && both_valid? && @sender.balance >= @amount
            @sender.balance = @sender.balance -  @amount
            @receiver.balance += @amount
            @status = "complete"
        else
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
        end
    end
    def reverse_transfer()
      if @status == "complete"
        @receiver.balance -= @amount
        @sender.balance  += @amount
        @status = "reversed"
      end
    end
end

# bank1 = BankAccount.new("open","Cristina")
# bank2 = BankAccount.new("Clarissa")

# firstTransfer = Transfer.new(bank1, bank2, 100)
# puts firstTransfer.execute_transaction
# puts firstTransfer.reverse_transfer