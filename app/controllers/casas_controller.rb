class CasasController < ApplicationController

  def index
    @casas = Casa.all
    sleep(1.0);  #para probar el asincronismo

    respond_with(@casas)
  end

  def show

  end  

  def create
    @casa = Casa.create(casas_params)

    respond_with(@casa)
  end

  def casas_params
    params.require(:casa).permit(
      :nombre,
      :patrimonio,
      :fundada_en
    )
  end
end