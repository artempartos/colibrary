class BuilderWithTypeChecker < SimpleForm::FormBuilder
  def find_attribute_column(attribute_name)
    if @object.class < ApplicationTypeWithoutActiveRecord \
      || @object.class < ApplicationType

      permits = @object.class._args
      if permits.exclude?(attribute_name)
        #FIXME проверять во вложенном хеше только если это связь has_many
        last = permits.last
        if !last.respond_to?(:exclude?) || last.exclude?(attribute_name)
          message = "Attribute '#{attribute_name}' doesn't exist in permit array of '#{@object.class}': #{permits}"
          Rails.logger.warn Term::ANSIColor.red(message)
          raise ArgumentError, message
        end
      end
    end

    super
  end
end
