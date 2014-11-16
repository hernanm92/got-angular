class HeroesController < ApplicationController

  def index
    @heroes = []

    if(params.has_key? :casa)
      @heroes = Heroe.where(casa_id: params[:casa])
    else
      @heroes = Heroe.all.order(:nombre)
    end

    respond_with(@heroes)
  end

  def create
    @heroe = Heroe.create(casas_params)

    respond_with(@heroe)
  end

  def casas_params
    params.require(:heroe).permit(
      :poder,
      :nombre,
    ).merge({
      type: 'Heroe',
      casa: casa
    })
  end

  def casa
    Casa.find_by(nombre: params[:heroe][:casa])
  end
end