#!/bin/env ruby
# encoding: utf-8

Given(/^estoy en la pagina de Registro de pagos$/) do
  visit (SECCION_REGISTRAR_PAGOS)
  page.should have_content("Registro de pagos")
end

When(/^hago click en "(.*?)"$/) do |boton|
  has_button?(boton).should eq true
  #click_link_or_button('Registrar Pago')
end

Then(/^se muestra el mensaje "(.*?)"$/) do |mensaje|
  
end



