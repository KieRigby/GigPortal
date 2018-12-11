class AddPromotersToEvents < ActiveRecord::Migration[5.0]
  def up
    add_reference :events,:promoter, index:true
    Event.reset_column_information

    promoter = Promoter.first

    Event.all.each do |event|
      event.promoter_id = promoter.id
      event.save!
    end

    change_column_null :events,:promoter_id, false
    add_foreign_key :events, :promoters

  end

  def down
    remove_foreign_key :events, :promoters
    remove_reference :events, :promoter, index:true
  end

end
