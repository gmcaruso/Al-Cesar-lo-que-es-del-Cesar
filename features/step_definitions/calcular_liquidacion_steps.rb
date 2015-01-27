#!/bin/env ruby
# encoding: utf-8

Given(/^estoy en la pagina de Liquidaciones$/) do
  visit (SECCION_LIQUIDACIONES)
  page.should have_content("Liquidación")
end

Given(/^una persona de nombre "(.*?)" paga el servicio "(.*?)" con un monto de "(.*?)" el dia "(.*?)"$/) do |nombre, servicio, monto, fecha|
  step "estoy en la pagina de Registro de pagos"

  find_by_id("servicio_input")
  find_by_id("monto_input")
  find_by_id("pagador_input")
  find_by_id("pago_fecha_de_pago")

  fill_in('servicio_input', :with => servicio)
  fill_in('monto_input', :with => monto)
  fill_in('pagador_input', :with => nombre)
  fill_in('pago_fecha_de_pago', :with => fecha)

end

Given(/^"(.*?)" esta en la vivienda$/) do |nombre|
  visit(SECCION_VER_PAGOS)
  page.should have_content(nombre).count.should eql(1)
end

Then(/^se muestra el resultado del calculo de liquidacion "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12|

end

Then(/^se muestra el resultado del calculo de liquidacion con deuda externa "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3|
end

Then(/^se muestra el resultado del calculo de liquidacion con deuda interna "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3|
end

Then(/^se muestra el resultado del calculo de liquidacion con deuda sin pagos "(.*?)"$/) do |arg1|
end

