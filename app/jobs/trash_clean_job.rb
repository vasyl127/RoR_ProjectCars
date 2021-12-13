class TrashCleanJob < ApplicationJob
  queue_as :default

  def perform
    TrashCleanMailer.with(user: 'user@exmple.com').clean_trash_done.deliver_now if TrashService.delete_all_obj
    puts 'TrashCleanJob --> work'
  end
end
