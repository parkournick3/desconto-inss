# frozen_string_literal: true

class ProponentsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_proponent, only: %i[show edit update destroy]

  def index
    @proponents = Proponent.all
  end

  def show; end

  def new
    @proponent = Proponent.new
  end

  def edit; end

  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      flash.now[:notice] = 'Proponent was successfully created.'
      render turbo_stream: [
        turbo_stream.prepend('proponents', @proponent),
        turbo_stream.replace(
          'form_proponent',
          partial: 'form',
          locals: { proponent: Proponent.new }
        )
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @proponent.update(proponent_params)
      flash.now[:notice] = 'Proponent was successfully updated.'
      render turbo_stream: [
        turbo_stream.replace(@proponent, @proponent)
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proponent.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@proponent)}_container") }
      format.html { redirect_to todos_url, notice: 'Proponent was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params.require(:proponent).permit(:name)
  end
end
