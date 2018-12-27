require "tplink_smarthome_api/version"
require 'json'

class TplinkSmarthomeApi
  attr_accessor :ip_address, :verbose

  def initialize(ip_address, verbose: false)
    raise RuntimeError unless smarthome_cli_available?
    @ip_address = ip_address
    @verbose = verbose
  end

  def power_on(delay: 0)
    switch_power true, delay: delay
    self
  end

  def power_off(delay: 0)
    switch_power false, delay: delay
    self
  end

  def switch_power(value, delay: 0)
    sleep(delay)
    log("[#{Time.now}] Switching power #{value ? 'on' : 'off'} for #{ip_address}...")
    payload = { system: {
                set_relay_state: { state: value ? 1 : 0 }
              } }.to_json
    send_command payload
    self
  end

  private

  def send_command(payload)
    `tplink-smarthome-api sendCommand #{ip_address} '#{payload}'`
    self
  end

  def smarthome_cli_available?
    `which tplink-smarthome-api`
    return true if $? == 0

    puts "[#{Time.now}] tplink-smarthome-api could not be found."
    puts "[#{Time.now}] To install it, run: `npm install -g tplink-smarthome-api`"
    false
  end

  def log(payload)
    puts payload if verbose
  end
end
