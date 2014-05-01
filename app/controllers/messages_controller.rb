class MessagesController < ApplicationController

  def create
    crack = Crack::XML.parse(request.body.string)
    parsed_params = crack["soap:Envelope"]["soap:Body"]["SendRequest"]

    @sms = Message.create!(:from => parsed_params["originatingAddress"], :to => parsed_params["destinationAddress"], :body => parsed_params["userData"], :identifier => parsed_params["correlationId"])
  end

  def index
    to = params[:to]
    after = params[:after].try(:to_time) || 1000.years.ago

    @sms_list = Message.where(:to => to).where("created_at >= '#{after}'")
  end

  def wsdl
   render :text => File.read('app/views/messages/wsdl.xml'), :content_type => 'application/xml', :layout => false
  end
end