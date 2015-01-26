class Pago
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :servicio, String
  property :pagador, String
  property :monto, Integer
  property :fecha_de_pago, Date
end
