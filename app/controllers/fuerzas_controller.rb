class FuerzasController < ApplicationController

  def index
    @fuerzas = []

    if(params.has_key? :casa)
      @fuerzas = Fuerza.where(type: ['Aerea','Naval','Terrestre'], casa_id: params[:casa])  #hizo un if feo para simplificar
    else  
      @fuerzas = Fuerza.where(type: ['Aerea','Naval','Terrestre']).order(:casa_id)
    end  

    respond_with(@fuerzas)
  end

  def create
    @fuerza = Fuerza.create(casas_params)

    respond_with(@fuerza)
  end

  def casas_params
    params.require(:fuerza).permit(
      :type,
      :cantidad_dragones,
      :cantidad_barcos,
      :cantidad_soldados
    ).merge({
      casa: casa
    })
  end

  def casa
    Casa.find_by(nombre: params[:fuerza][:casa])
  end
end