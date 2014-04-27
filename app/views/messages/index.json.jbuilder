json.array!(@sms_list) do |sms|
  json.partial!("message", :message => sms)
end