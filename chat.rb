# Write your solution here!

require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OpenAI_key"))

pp "Hello! How can I help you today?"
client_response = ""
while client_response != "Bye"
  puts "-"*50
  client_response = gets.chomp
  # Prepare an Array of previous messages
  message_list = [
  {
    "role" => "system",
    "content" => "Hello! How can I help you today?"
  },
  {
    "role" => "user",
    "content" => "#{client_response}"
  }
]
  # Call the API to get the next message from GPT
  api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
) 
  response1 = api_response.fetch("choices")
  response2 = response1.at(0).fetch("message")
  puts response3 = response2.fetch("content")
  message_list.push({ "role" => "assistant", "content" => "#{client_response}"})
  if client_response == "Bye"
    pp "Have a great day ahead"
  end
end
