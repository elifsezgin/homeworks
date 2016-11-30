# create_table "houses", force: :cascade do |t|
#   t.string "adress", null: false
# end

class House < ActiveRecord::Base
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
