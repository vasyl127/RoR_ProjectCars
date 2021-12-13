class TrashCleanMailer < ApplicationMailer
  before_action :check_adm_email

  def clean_trash_done
    mail to: @admin_email, subject: 'Trash clean | PRJ_CAR'
  end

  def clean_trash_fail(errors)
    @errors = errors
    mail to: @admin_email, subject: 'Trash clean | PRJ_CAR'
  end

  private

  def check_adm_email
    @admin_email = 'admin@example.com'
  end
end
