class Pago
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :servicio, String
  property :pagador, String
  property :monto, Integer
  property :fecha_de_pago, Date

  def self.monto_total
    Pago.all.inject(0) { |suma, pago| suma + pago.monto }
  end

  def self.monto_por_persona
    Pago.monto_total / Pago.all.size
  end

  def self.pago_por_persona(nombre_pagador)
    Pago.all(pagador: nombre_pagador).inject(0) { |suma, pago| suma + pago.monto }
  end

  def self.estado_habitantes
    Pago.all.inject({}) do |habitantes, pago|
      pago_habitante = Pago.monto_por_persona - Pago.pago_por_persona(pago.pagador)
      habitantes[pago.pagador] = pago_habitante
      habitantes
    end
  end

end
