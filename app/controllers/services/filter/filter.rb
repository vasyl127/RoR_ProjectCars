require_relative '../../../models/car'
require_relative '../../../models/race'

class Filter
  attr_reader :scope
   
  def initialize(scope)
    @scope = scope
  end

  def find_actice
    scope.where(deleted: 0)
  end

  def find_deleted
    scope.where(deleted: 1)
  end

  def find_by_id(id)
    scope.find_by id: id
  end
end
