class QueuedMessage < Message
  # This would perform some action based on the body of the message
  def process_message_action
    handle_message
  end

  # this forcefully changes the type of the object
  def handle_message
    self[:type] = HandledMessage.name
    self.save!
    self.reload
  end
end
