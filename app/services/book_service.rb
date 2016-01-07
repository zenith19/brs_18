class BookService
  def initialize book
    @book = book
  end

  def save
    if @book.save
      true
    else
      false
    end
  end

  def update book_params
    if @book.update_attributes book_params
      true
    else
      false
    end
  end

  def destroy
    if @book.valid?
      @book.destroy
      true
    else
      false
    end
  end
end
