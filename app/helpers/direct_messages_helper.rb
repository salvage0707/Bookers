module DirectMessagesHelper
		# 送り主によって配置を変更
	def change_pull_class(direct_message)
		if direct_message.user == current_user
			class_name = "pull-left"
			class_name
		else
			class_name = "pull-right"
			class_name
		end
	end
end
