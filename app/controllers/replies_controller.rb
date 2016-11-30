class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # POST /replies
  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      message = @reply.save ? 'Reply was successfully created.' : 'Failed'
      format.html { redirect_to request.referer, notice: message }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.fetch(:reply, {})
      params.require(:reply).permit(:blog_id, :comment)
    end
end
