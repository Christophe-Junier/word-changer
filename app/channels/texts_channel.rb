class TextsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "the_text"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
