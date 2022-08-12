class Detail < ApplicationRecord
  belongs_to :employee
  # validates :name, presence: true
  # validates :address , presence: true
  # validates :f_name, presence: true
  # validates :m_name , presence: true
  # before_save { self.name = name.upcase }
  # before_save { self.address = address.upcase }
  # before_save { self.f_name = f_name.upcase }
  # before_save { self.m_name = m_name.upcase }
end