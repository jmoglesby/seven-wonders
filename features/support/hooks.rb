# frozen_string_literal: true

require 'watir'
require 'webdrivers'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end
