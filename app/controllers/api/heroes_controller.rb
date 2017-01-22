class Api::HeroesController < ApplicationController
  before_action :set_hero, only: [:show, :update, :destroy]

  def index
    @heroes = Hero.all

    render json: {data: @heroes.select(:id, :name)}
  end

  def show
    render json: {data: @hero}
  end

  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: {data: @hero}, status: :created
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  def update
    if @hero.update(hero_params)
      render json: {data: @hero}
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hero.destroy
  end

  private

    def set_hero
      @hero = Hero.find(params[:id])
    end

    def hero_params
      params.require(:hero).permit(:name)
    end
end
