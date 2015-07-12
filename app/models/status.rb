class Status < Post
  validates :body, presence: true, length: {maximum: 10, tokenizer: lambda{|x| x.split},
  too_long: "status can only be 10 words max!"}
end