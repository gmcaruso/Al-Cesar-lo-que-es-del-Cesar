AlCesarLoQueEsDelCesar::App.controllers :liquidaciones do
  
  get :contact , :map => '/contact' do
    render 'home/index'
  end

  get :home, :map => '/' do
    render 'home/index'
  end
end
