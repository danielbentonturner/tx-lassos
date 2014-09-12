class PendingController < ApplicationController

  def show
    @pending = Pending.new
    @pending_all = Pending.all
  end

  def accept_pending
    
  end

end
