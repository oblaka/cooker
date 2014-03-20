module BaseTypeWithoutActiveRecord

  include do
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Translation
  end

  def persisted?
    false
  end

end