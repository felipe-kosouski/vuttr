class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :update, :destroy]

  def index
    if params[:tag].blank?
      @tools = Tool.order(:id)
    else
      @tools = Tool.search(params[:tag])
    end
  end

  def show
    render status: :ok, include: :tags
  end

  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      render json: @tool, status: :created, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tool.update(tool_params)
      render json: @tool, status: :ok, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tool.destroy
    render status: :no_content
  end

  private

  def tool_params
    params.require(:tool).permit(:title, :link, :description, :tag, tags: [])
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
