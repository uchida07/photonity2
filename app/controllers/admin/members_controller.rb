class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Post.find(params[:id])
    @member.destroy
    redirect_to admin_root_path
  end
end
