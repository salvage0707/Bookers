module ApplicationHelper

	# ユーザーのプロフィール画像を表示するメソッド(クラスの指定も可能)
	def user_image_tag(user, width, height, *classes)
		if user.profile_image_id
			attachment_image_tag(user, :profile_image, :fill, width, height, format: 'jpg', class: classes )
		else
			image_tag('img/no_image.jpg', class: classes, style: "width: #{width}px; height: #{height}px;")
		end
	end

end
