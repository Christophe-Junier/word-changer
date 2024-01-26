class UpdateTextsWordJob < ActiveJob::Base
  queue_as :default

  def perform
    client = OpenAI::Client.new

    Text.not_recently_updated.find_each do |text|
      random_word = text.words.sample
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [
            { role: "system", content: "change ce mot" },
            { role: "user", content: random_word.content }
          ], # Required.
        })
      random_word.update(content: response.dig("choices", 0, "message", "content"))
      text.update(updated_at: DateTime.current)
      ActionCable.server.broadcast("the_text", random_word.id)
    end
  end
end
