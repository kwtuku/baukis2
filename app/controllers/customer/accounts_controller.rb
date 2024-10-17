class Customer::AccountsController < Customer::Base
  def show
    @customer = current_customer
  end

  def edit
    @customer_form = Customer::AccountForm.new(current_customer)
  end

  # PATCH
  def confirm
    @customer_form = Customer::AccountForm.new(current_customer)
    @customer_form.assign_attributes(params[:form])
    if @customer_form.valid?
      render action: "confirm", status: :accepted
    else
      flash.now.alert = "⼊⼒に誤りがあります。"
      render action: "edit", status: :unprocessable_entity
    end
  end

  def update
    @customer_form = Customer::AccountForm.new(current_customer)
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = "アカウント情報を更新しました。"
      redirect_to :customer_account, status: :see_other
    else
      flash.now.alert = "⼊⼒に誤りがあります。"
      render action: "edit", status: :unprocessable_entity
    end
  end
end
