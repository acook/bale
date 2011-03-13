class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      redirect_to @actor, :notice => "Successfully created actor."
    else
      render :action => 'new'
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(params[:actor])
      redirect_to @actor, :notice  => "Successfully updated actor."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to actors_url, :notice => "Successfully destroyed actor."
  end
end
