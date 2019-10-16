class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
   if @sender.valid? && @receiver.valid?
     true
  else
    false
  end
end

  def execute_transaction
    if @sender.valid? == true && @sender.balance > @amount && @status == "pending"
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"

    elsif @sender.balance > @amount && @status == "complete"
    @sender.balance = @sender.balance
    @receiver.balance = @receiver.balance
  else
    @sender.valid? == false && @status == "pending"
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end