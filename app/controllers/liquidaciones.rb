AlCesarLoQueEsDelCesar::App.controllers :liquidaciones do

  get :liquidacion do
    @monto_total = Pago.monto_total
    @monto_por_persona = Pago.monto_por_persona
    @habitantes = Pago.estado_habitantes
    render 'liquidaciones/liquidacion'
  end

end
