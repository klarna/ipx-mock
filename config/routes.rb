IpxMock::Application.routes.draw do
  root 'home#index'

  resources :messages

  get  'api/services2/SmsApi52' => 'messages#wsdl'
end
