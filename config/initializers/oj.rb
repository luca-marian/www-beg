module ActiveSupport::JSON
  ## Add fast JSON parser
  def self.decode(json)
    data = ::Oj.load(json)

    if ActiveSupport.parse_json_times
      convert_dates_from(data)
    else
      data
    end
  end
end
