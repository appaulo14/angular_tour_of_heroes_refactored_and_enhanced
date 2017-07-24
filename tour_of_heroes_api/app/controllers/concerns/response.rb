module Response
  def json_response(object, status = :ok)
    render JSON: object, status: status
  end
end

