# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  course_name :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classroom < ActiveRecord::Base
  has_many :classroom_students
  has_many :students, through: :classroom_students

  def self.search(query)
    query.present? ? self.all.select { |student| student.name.downcase.include?(query.downcase) } : self.all
  end
end
