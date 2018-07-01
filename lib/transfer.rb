class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if @sender.balance >= @amount && @status != complete
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end
end
