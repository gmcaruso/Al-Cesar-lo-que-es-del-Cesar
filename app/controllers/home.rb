AlCesarLoQueEsDelCesar::App.controllers :home do
  
  get :home, :map => '/' do
    render 'home/index'
  end
  

end
