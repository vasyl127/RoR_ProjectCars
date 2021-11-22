class TrashCleanJob < ApplicationJob
  queue_as :default

  def perform(objects)
    if objects.preset?
      #delete
      #drop_mail
    end
  end
end
