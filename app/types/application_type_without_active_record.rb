module ApplicationTypeWithoutActiveRecord
  extend ActiveSupport::Concern

  included do
    include Virtus.model

    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Translation
  end

  module ClassMethods
    def _args
      attributes_set.map(&:name)
    end
  end

  def persisted?
    false
  end
end
