class Public::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = current_member
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end

  private
  def member_params
    params.require(:member).permit(:account_name, :email, :introduction, :profile_image)
  end
end
