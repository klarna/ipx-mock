class MessagesController < ApplicationController

  def create
    @sms = Message.create!(:from => params[:originatingAddress], :to => params[:destinationAddress], :body => params[:userData], :identifier => params[:correlationId])
  end

  def index
    to = params[:to]
    after = params[:after].try(:to_time) || 1000.years.ago

    @sms_list = Message.where(:to => to).where("created_at >= '#{after}'")
  end

end