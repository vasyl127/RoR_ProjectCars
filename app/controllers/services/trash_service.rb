
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

end
