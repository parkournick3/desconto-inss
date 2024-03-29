# frozen_string_literal: true

class ProponentsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_proponent, only: %i[show edit update destroy]

  def index
    @proponents = Proponent.page(params[:page]).ordered
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
      respond_to do |format|
        format.html { redirect_to proponents_url, notice: 'Proponent was successfully created.' }
        format.json { render :show, status: :created, location: @proponent }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @proponent.update(proponent_params)
      flash.now[:notice] = 'Proponent was successfully updated.'
      respond_to do |format|
        format.html { redirect_to proponents_url, notice: 'Proponent was successfully updated.' }
        format.json { render :show, status: :ok, location: @proponent }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proponent.destroy

    respond_to do |format|
      # format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@proponent)}_container") }
      format.html { redirect_to proponents_url, notice: 'Proponent was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  def calculate_inss_discount
    gross_salary = params[:gross_salary].to_f

    inss_discount = CalculateInssDiscountService.new(gross_salary:).calculate[:discount]

    render json: { inss_discount: }
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params.require(:proponent).permit(:name, :cpf, :street_name, :house_number, :neighborhood, :city, :state,
                                      :phone_number, :gross_salary, :inss_discount)
  end
end
