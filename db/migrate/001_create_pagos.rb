migration 1, :create_pagos do
  up do
    create_table :pagos do
      column :id, Integer, :serial => true
      column :servicio, DataMapper::Property::String, :length => 255
      column :pagador, DataMapper::Property::String, :length => 255
      column :monto, DataMapper::Property::Integer
      column :fecha_de_pago, DataMapper::Property::Date
    end
  end

  down do
    drop_table :pagos
  end
end
