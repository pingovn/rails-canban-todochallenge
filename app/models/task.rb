class Task < ActiveRecord::Base
  belongs_to :challenge

  validates :name, :type, :point, presence: true
  validates :type, inclusion: {in: %w(DailyTask WeeklyTask MonthlyTask)}
  validates :point, numericality: {only_integer: true, less_than: 50}

  class << self
    def type_collection
      [['Daily', 'DailyTask'],
       ['Weekly', 'WeeklyTask'],
       ['Monthly', 'MonthlyTask']
      ]
    end
  end

end
