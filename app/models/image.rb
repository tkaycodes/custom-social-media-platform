class Image < Post
  has_attached_file :body, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/defaultpic.jpg"
  validates_attachment_content_type :body, :content_type => /\Aimage\/.*\Z/
end