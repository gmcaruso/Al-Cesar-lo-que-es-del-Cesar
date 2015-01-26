Feature: Calcular liquidacion

Background:
  Given estoy en la pagina de "Liquidaciones"

Scenario: Calcular liquidacion cuando hay varias personas y todas pagaron lo mismo
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  And "Jorge" registro un pago de "100"
  And "Pepe" registro un pago de "100"
  And "Pipo" registro un pago de "100"
  Then se muestra el resultado del calculo de liquidacion "Monto " "300 " "Total, pagado sin deudas!" "Jorge " "pagó: " "100" "Pepe " "pagó: " "100" "Pipo " "pagó: " "100"

Scenario: Calcular liquidacion cuando algunos no pagaron y el resto si
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  And "Jorge" registro un pago de "100"
  And "Pepe" registro un pago de "100"
  Then se muestra el resultado del calculo de liquidacion con deuda externa "Pipo " "debe efectuar un pago de " "100" 

Scenario: Calcular liquidacion cuando se pago de manera dispareja
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  And "Jorge" registro un pago de "120"
  And "Pepe" registro un pago de "100"
  And "Pipo" registro un pago de "80"
  Then se muestra el resultado del calculo de liquidacion con deuda interna "A Jorge le deben 20" "Pepe pagó sus cuentas" "Pipo debe 20"

Scenario: Calcular liquidacion sin registro de pagos
  Given "Jorge" esta en la vivienda
  And "Pepe" esta en la vivienda
  And "Pipo" esta en la vivienda
  Then se muestra el resultado del calculo de liquidacion con deuda sin pagos "No se registro ningun pago aún. Deben pagar un total de " "300" 