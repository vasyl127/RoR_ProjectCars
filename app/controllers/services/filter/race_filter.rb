require_relative 'filter'

class RaceFilter < Filter
  def races_all
    Race.where(deleted: 0)
  end

  def races_deleted
    Race.where(deleted: 1)
  end

  def race_by_id(id)
    Race.find_by id: id
  end
end
