require 'rubygems'
require 'watir'
require 'cucumber'
require 'builder'
require 'nokogiri'

Given(/^I open the browser to (.*)$/) do |website|
  @browser = Watir::Browser.new
  @browser.goto website
end

Given(/^I open Chrome to (.*)$/) do |website|
  @browser = Watir::Browser.new :chrome
  @browser.goto website
end

And(/^I close the browser$/) do
  @browser.close
end

Then(/^I use the link (.*)$/) do |link|
  sleep(5)
  @browser.a(:text => link).click
end

And(/^I use the button (.*)$/) do |button|
  sleep(5)
  @browser.button(:text => button).click
end

And(/^I click the div class (.*)$/) do |div_class|
  sleep(5)
  @browser.div(:class => div_class).click
end

And(/^I use the nested button (.*) in div (.*)$/) do |button_text, div_class|
  sleep(5)
  @browser.div(:class => div_class).button(:text => button_text).click
end

And(/^I flash the div class (.*)$/) do |div_class|
  sleep(5)
  @browser.div(:class => div_class).flash
end

And(/^I set the dropdown (.*) with (.*)$/) do |dropdown_id, selection|
  sleep(20)
  @browser.select(:id => dropdown_id).select selection
end

And(/^I set the dropdown (.*) randomly$/) do |dropdown_id|
  sleep(5)
  website = Nokogiri::HTML.parse(@browser.html)

  dropdown = website.css("select[@id="+dropdown_id+"] option")
  selection = rand(dropdown.count)

  @browser.select(:id => dropdown_id).select dropdown[selection].text
end

And(/^I select the first link of class (.*)$/) do |link_class|
  sleep(5)
  @browser.a(:class => link_class, :style => "display: inline-block;").click
end


Then(/^I set the textbox (.*) to (.*)$/) do |textbox_id, text|
  @browser.text_field(:id => textbox_id).set text
end

Then(/^I verify my submital with phrase (.*)$/) do |verification_phrase|
  sleep(5)
  @browser.p(:text => verification_phrase).flash
end

Then(/^I click the button of id (.*)$/) do |button_id|
  @browser.button(:id => button_id).click
end

And(/^I tab to the next available element$/) do
  @browser.send_keys :tab
  @browser.send_keys :enter
end