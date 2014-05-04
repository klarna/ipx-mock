IpxMock::Application.routes.draw do
  resources :messages

  get  'api/services2/SmsApi52' => 'messages#wsdl'
end
