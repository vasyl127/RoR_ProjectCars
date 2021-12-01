class TrashCleanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # if !TrashController.trash_empty?
    #   TrashController.clean_all
    #   TrashCleanMailer.with(user: 'user@exmple.com').clean_trash.deliver_later
    # end
    puts "It's works!!!!!"
  end
end
