class UserDecorator < ApplicationDecorator
  def full_name
    [object.first_name, object.last_name].join(' ')
  end

  def created_at
    l(object.created_at, format: :short)
  end

  def updated_at
    l(object.created_at, format: :short)
  end
end
