class DirectMessagesController < ApplicationController

	def index
		# 自分とメッセージ交換を制限
		if @user == current_user
			redirect_to user_path(current_user.id)
		end

		@user = User.find(params[:user_id])
		@me = current_user
		@message = DirectMessage.new
		# 相手が贈ったものを追加, 自分が贈ったものを追加
		@direct_messages = DirectMessage.where("(user_id = ?) OR (to_user_id = ?)",current_user, current_user)
	end

	def create
		user = User.find(params[:user_id])
		direct_message = current_user.direct_messages.new(direct_message_params)
		direct_message.to_user_id = user.id
		direct_message.save
		redirect_to user_direct_messages_path(user_id: user.id)
	end

	private

		def direct_message_params
			params.require(:direct_message).permit(:direct_message)
		end


end


