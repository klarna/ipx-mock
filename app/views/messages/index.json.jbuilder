json.array!(@sms_list) do |sms|
  json.partial!(:message, :messages => sms)
end