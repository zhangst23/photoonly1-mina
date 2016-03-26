class Post < ActiveRecord::Base
	
	has_many :comments
	
	#第一个参数对应的是Post中的属性字段名，第二个参数是用来上传图片的类名（即刚刚用rails g uploader Picture生成的类）
	mount_uploader :picture, PictureUploader
	
	validate :picture_size
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  	acts_as_taggable_on :skills, :interests
  	acts_as_votable
  	acts_as_commentable








	private

	def picture_size
		if picture.size > 5.megabytes
			errors.add(picture: "不能上传超过5MB的图片")
		end
	end


end
