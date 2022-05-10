class Public::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.update(member_params)
    redirect_to members_path
  end

  private
  def member_params
    params.require(:member).permit(:account_name, :email, :introduction, :profile_image)
  end
end
