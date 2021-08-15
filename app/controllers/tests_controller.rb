class TestsController < ApplicationController
  before_action :set_test, only: %i[ show update destroy ]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    if @test.save
      render :show, status: :created, location: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    if @test.update(test_params)
      render :show, status: :ok, location: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:test)
    end
end
