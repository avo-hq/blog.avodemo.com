class Avo::ToolsController < Avo::ApplicationController
  def custom_tool
    @page_title = "Custom tool"
    add_breadcrumb "Custom tool"

    @something = Comment.count
  end
end
