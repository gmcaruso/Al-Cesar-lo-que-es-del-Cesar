Feature: Calcular liquidacion

Background:
  Given estoy en la pagina de Liquidaciones

Scenario: Calcular liquidacion cuando hay varias personas y todas pagaron lo mismo
  Given una persona de nombre "Jorge" paga el servicio "Luz" con un monto de "100" el dia "2015-01-01"
  And una persona de nombre "Pepe" paga el servicio "Tv" con un monto de "100" el dia "2015-01-01"
  And una persona de nombre "Pipo" paga el servicio "Agua" con un monto de "100" el dia "2015-01-01"
  And "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  Then se muestra el resultado del calculo de liquidacion "Monto " "300 " "Total, pagado sin deudas!" "Jorge " "pagó: " "100" "Pepe " "pagó: " "100" "Pipo " "pagó: " "100"

  Scenario: Calcular liquidacion cuando algunos no pagaron y el resto si
  Given una persona de nombre "Jorge" paga el servicio "Luz" con un monto de "100" el dia "2015-01-01"
  And una persona de nombre "Pepe" paga el servicio "Tv" con un monto de "100" el dia "2015-01-01"
  And una persona de nombre "Pipo" paga el servicio "Tv" con un monto de "0" el dia "2015-01-01"
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  Then se muestra el resultado del calculo de liquidacion con deuda externa "Pipo " "debe efectuar un pago de " "100" 

Scenario: Calcular liquidacion cuando se pago de manera dispareja
  Given una persona de nombre "Jorge" paga el servicio "Luz" con un monto de "120" el dia "2015-01-01"
  And una persona de nombre "Pepe" paga el servicio "Tv" con un monto de "100" el dia "2015-01-01"
  And una persona de nombre "Pipo" paga el servicio "Tv" con un monto de "80" el dia "2015-01-01"
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  Then se muestra el resultado del calculo de liquidacion con deuda interna "A Jorge le deben 20" "Pepe pagó sus cuentas" "Pipo debe 20"

Scenario: Calcular liquidacion sin registro de pagos
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  Then se muestra el resultado del calculo de liquidacion con deuda sin pagos "Todos los pagos estan al día!!!"