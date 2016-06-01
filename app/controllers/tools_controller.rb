class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to @tool
      flash[:notice] = "Tool Saved!"
    else
      flash[:notice] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

  def most_recent_tool
    @tool = Tool.find(params[:id])
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

end
