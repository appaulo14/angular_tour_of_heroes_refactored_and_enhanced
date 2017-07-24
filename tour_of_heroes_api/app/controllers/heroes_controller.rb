class HeroesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    render :text => "Couldn't find hero.", :content_type => 'text/plain', :status => 404
  end

  # GET /heroes
  def index
    @heroes = Hero.all
    json_response(@heroes)
  end

  # POST /heroes
  def create
    @hero = Hero.create!(params)
    json_response(@hero, :created)
  end

  # GET /heroes/:id
  def show
    @hero=Hero.find_by(id: params[:id])
    if @hero == nil
        render status: 404
    else
        render json: @hero
    end
  end

  # PUT /heroes/:id
  def update
    @hero.update(params)
    head :no_content
  end

  # DELETE /heroes/:id
  def destroy
    @hero.destroy
    head :no_content
  end
end
