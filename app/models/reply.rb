class Reply < ActiveRecord::Base
  belongs_to :blog, foreign_key: "blog_id"
end
