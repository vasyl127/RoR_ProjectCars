class TrashCleanJob < ApplicationJob
  queue_as :default

  def perform
    TrashController.empty_bin
    TrashCleanMailer.with(user: 'user@exmple.com').clean_trash_done.deliver_now
    puts 'TrashCleanJob --> work'
  end
end
