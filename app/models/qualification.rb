class Qualification < ApplicationRecord
  belongs_to :employee
  before_save { self.yop = yop.upcase }
  before_save { self.stream = stream.upcase }
  before_save { self.project = project.upcase }
  before_save { self.aggregate = aggregate.upcase }
end