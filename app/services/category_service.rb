class CategoryService
  def initialize category
    @category = category
  end

  def save
    if @category.save
      true
    else
      false
    end
  end

  def update category_params
    if @category.update_attributes category_params
      true
    else
      false
    end
  end

  def destroy
    if @category.valid?
      @category.destroy
      true
    else
      false
    end
  end
end
