AlCesarLoQueEsDelCesar::App.controllers :pagos do
  
  get :registrarpagos do
    @pago = Pago.new
    render 'pagos/registrar_pagos'
  end

  get :verpagos do
    @pagos = Pago.all
    render 'pagos/ver_pagos'
  end

  post :registrar do
    servicio = params[:pago][:servicio]
    pagador = params[:pago][:pagador]
    monto = params[:pago][:monto]
    fecha_de_pago = params[:pago][:fecha_de_pago]

    if (monto.to_i  < 0)
      flash.now[:error] = 'No se permite pagar con un monto menor a cero'
      render 'pagos/registrar_pagos'
    else
      pago=Pago.create(servicio: servicio, pagador: pagador, monto: monto, fecha_de_pago: fecha_de_pago)
      pago.save
      render 'home/index'
    end
  end

end