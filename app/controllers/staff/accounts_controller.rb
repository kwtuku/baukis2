class Staff::AccountsController < Staff::Base
  def show
    @staff_member = current_staff_member
  end

  def edit
    @staff_member = current_staff_member
  end

  # PATCH
  def confirm
    @staff_member = current_staff_member
    @staff_member.assign_attributes(staff_member_params)
    if @staff_member.valid?
      render action: "confirm", status: :accepted
    else
      flash.now.alert = "⼊⼒に誤りがあります。"
      render action: "edit", status: :unprocessable_entity
    end
  end

  def update
    @staff_member = current_staff_member
    @staff_member.assign_attributes(staff_member_params)
    if params[:commit]
      if @staff_member.save
        flash.notice = "アカウント情報を更新しました。"
        redirect_to :staff_account, status: :see_other
      else
        render action: "edit", status: :unprocessable_entity
      end
    else
      render action: "edit", status: :accepted
    end
  end

  private def staff_member_params
    params.require(:staff_member).permit(
      :email, :family_name, :given_name,
      :family_name_kana, :given_name_kana,
    )
  end
end
