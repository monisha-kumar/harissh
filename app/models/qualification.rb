class Qualification < ApplicationRecord
  belongs_to :employee
  # validates :stream, presence: true
  # validates :project, presence: true
  # validates :aggregate, presence: true
  #
  # before_save { self.stream = stream.upcase }
  # before_save { self.project = project.upcase }
  # before_save { self.aggregate = aggregate.upcase }
end