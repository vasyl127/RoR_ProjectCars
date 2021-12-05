require_relative '../controllers/trash_controller'

class TrashCleanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # if TrashController.trash_present?
    #   TrashController.clean_all
    #   TrashCleanMailer.with(user: 'user@exmple.com').clean_trash.deliver_later
    # end
    puts "TrashCleanJob --> work"
  end
end
