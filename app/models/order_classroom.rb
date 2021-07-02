class OrderClassroom < ApplicationRecord
  belongs_to :classroom
  belongs_to :order

  def find_classroom
    Classroom.find(classroom_id)
  end

  def self.sub_total(order)
    if order.order_classrooms
      order.order_classrooms.sum do |order_classroom|
        order_classroom.price * order_classroom.quantity
      end
    else
      0
    end
  end
end
