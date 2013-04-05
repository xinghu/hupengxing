class Comment < ActiveRecord::Base
  has_ancestry
  
  belongs_to :blog

  validates_presence_of :name, :content
  validates_presence_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  attr_accessor :captcha
  
  scope :recent_comments, order("created_at desc").limit(20)
  
  after_save :recount_comments
  after_destroy :recount_comments
  
  def recount_comments
    $cache.write :latest_comments, Comment.recent_comments.to_a
  end
  
  def self.get_cache_comments
    comments = $cache.read(:latest_comments)
    return comments.present? ? comments : Comment.recent_comments.to_a
  end

end
