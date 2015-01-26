Feature: Registrar pago

Background:
  Given estoy en la pagina de "Registro de pagos"

Scenario: Registrar pago
  Given una persona de nombre "Jorge"
  And paga el servicio "luz" con un monto de "100" el dia "2015-01-01"
  When hago click en "Resgistrar Pago"
  Then se muestra el mensaje "El pago ha sido regitrado"

Scenario: Registrar pago sin registrar persona
  Given una persona de nombre ""
  And paga el servicio "luz" con un monto de "100" el dia "2015-01-01"
  When hago click en "Resgistrar Pago"
  Then se muestra el mensaje "Debe ingresar una persona para registrar el pago"

Scenario: Registrar pago sin un servicio a pagar
  Given una persona de nombre "Jorge"
  And paga el servicio "luz" con un monto de "100" el dia "2015-01-01"
  When hago click en "Resgistrar Pago"
  Then se muestra el mensaje "Debe haber un sevicio a pagar para registrar el pago"

Scenario: Registrar pago con un monto negativo
  Given una persona de nombre "Jorge"
  And paga el servicio "luz" con un monto de "-100" el dia "2015-01-01"
  When hago click en "Resgistrar Pago"
  Then se muestra el mensaje "El monto debe ser positivo para registrar el pago"