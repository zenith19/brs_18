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
end
