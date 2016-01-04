module ImageValidation
  
  private
  def picture_size
    if picture.size > 3.megabytes
      errors.add :picture, I18n.t(:image_size_notification)
    end
  end  
end
  
