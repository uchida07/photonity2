class Admin::RepliesController < ApplicationController
  def destroy
    Reply.find(params[:id]).destroy
    redirect_to admin_root_path
  end
end
