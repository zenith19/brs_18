class RequestService
  def initialize request
    @request = request
  end

  def update request_params
    if @request.update_attributes request_params
      true
    else
      false
    end
  end
end
