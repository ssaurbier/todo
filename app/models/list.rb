class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
    attr_reader :phone_number


  validates :title, presence: true
  validates :title, uniqueness: true
  validates :user_id, presence: true

  def send_welcome_message
    welcome_message = "Sup. I'm the Mobilist. I'll handle your lists from now on."
    send_message(user.full_phone_number, welcome_message)
  end


  def update_list_response
    message_array = ["Boom shakalaka", "You got it.", "Yeah yeah ok I added it.", "Word.", "Added!", "Fasho", "Fer sure", "Gracias. I added it to your list.", "mmmmmmmmmmmmk", "Jeah!"]
    message = message_array.sample
    binding.pry
    send_message(user.full_phone_number, message)
  end

  def send_message(recipient_phone, body)
   twilio_number = ENV["TWILIO_PHONE_NUMBER"]
   client = Twilio::REST::Client.new(
     ENV["TWILIO_ACCOUNT_SID"],
     ENV["TWILIO_AUTH_TOKEN"]
   )
   client.account.messages.create(
     from: "#{twilio_number}",
     to: recipient_phone,
     body: body
   )
  end

end
