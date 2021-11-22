
class TrashService


    def move_to_trash(obj)
        obj.deleted = 1
        obj.save
        # flash[:success] = "#{obj.name} move to trash!"
    end

    def restrore(obj)
        obj.deleted = 0
        obj.save
        # flash[:success] = "#{obj.name} restored!"
    end

    def destroy_items_in_trash
        filter.cars_deleted.delete_all
        filter.races_deleted.delete_all
    end

    private 

    def filter
      @filter ||= Filter.new
    end

end
