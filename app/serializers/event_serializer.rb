class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :gst_number, :admin, :active, :logo, :icon,
             :published_name, :station_id, :station_name, :item_image,
             :help_url, :event_help_url, :show_date, :is_one_off, :start_date,
             :end_date, :is_allowed_to_order, :earliest_preorder_date,
             :latest_preorder_date

  def station_name
    object.station.try(:name)
  end

  def earliest_preorder_date
    object.earliest_preorder_date.try(:strftime, '%d-%m-%Y')
  end

  def latest_preorder_date
    object.latest_preorder_date.try(:strftime, '%d-%m-%Y')
  end

  def is_allowed_to_order
    (object.start_date.blank? || Date.today >= object.start_date) && (object.end_date.blank? || Date.today <= object.end_date)
  end
end
