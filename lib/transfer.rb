class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "complete" && valid? == true
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    elsif valid? == false
      "Transaction rejected. Please check your account balance."
    else
      "This transaction has already been completed."
    end
  end
end
