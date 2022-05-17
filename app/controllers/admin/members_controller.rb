class Admin::MembersController < ApplicationController
    def index
      if admin_signed_in?
        @members = Member.all
      else
        redirect_to new_admin_session_path
      end
    end

    def show
      if admin_signed_in?
        @member = Member.find(params[:id])
       else
        redirect_to new_admin_session_path
      end
    end

    def destroy
      @member = Post.find(params[:id])
      @member.destroy
      redirect_to admin_root_path
    end

end
