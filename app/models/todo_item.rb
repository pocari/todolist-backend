# frozen_string_literal: true

# == Schema Information
#
# Table name: todo_items
#
#  id                    :bigint           not null, primary key
#  completed(完了フラグ) :boolean          default(FALSE), not null
#  text(内容)            :string(255)      not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class TodoItem < ApplicationRecord
  validates :text, presence: true,
                   length: { maximum: MAX_STRING_LENGTH }
end
