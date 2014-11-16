class CasasController < ApplicationController

  def index
    @casas = Casa.all
    sleep(1.0);  #para probar el asincronismo

    respond_with(@casas)
  end

  def show
    @casa = Casa.find(params[:id]) #where(id: params[:id]) #quiero traerme una casa con un id especifico
  end  

  def create
    @casa = Casa.create(casas_params)

    respond_with(@casa)
  end

  def destroy
    Casa.destroy(params[:id]) #anda, pero tira internal server error
  end

  def casas_params
    params.require(:casa).permit(
      :nombre,
      :patrimonio,
      :fundada_en
    )
  end
end