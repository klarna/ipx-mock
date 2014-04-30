class MessagesController < ApplicationController

  def create

    body = request.body.string

    puts '@@@@@@@@@@@@@@@@'
    puts params
    puts body
    puts '@@@@@@END@@@@@@@'

    @sms = Message.create!(:from => params[:originatingAddress], :to => params[:destinationAddress], :body => params[:userData], :identifier => params[:correlationId])

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