class PowerStatusClient
  def initialize
  end

  def get_statuses
    response = Faraday.get(ENV.fetch('POWER_STATUS_URL', 'https://power-api.berylia.org/plant_status.json'))
    return [] if response.status != 200
    parsed = ActiveSupport::JSON.decode(response.body, symbol_keys: true) rescue [] # if we fail at parsing due to some errors, return empty set
  end
end