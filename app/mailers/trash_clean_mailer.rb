class TrashCleanMailer < ApplicationMailer
  before_action :check_adm_email

  def clean_trash
    mail to: @admin_email, subject: 'Trash clean | PRJ_CAR'
  end

  private

  def check_adm_email
    @admin_email = 'admin@example.com'
  end
end
