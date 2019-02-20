class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  before_validation :set_in_reply_to


  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size, :reply_to_user

  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def Micropost.including_replies(id)
    where(in_reply_to: [id, 0]).or(Micropost.where(user_id: id))
  end

  def set_in_reply_to
    if @index = content.index("@")
      reply_id = []
      while is_i?(content[@index+1])
        @index += 1
        reply_id << content[@index]
      end
      self.in_reply_to = reply_id.join.to_i
    else
      self.in_reply_to = 0
    end
  end

  def reply_to_user
    #返信先が指定なしの場合、チェックしない
    return if self.in_reply_to == 0
    #指定したIDのユーザが見つからない場合、エラートする。
    unless user = User.find_by(id: self.in_reply_to)
      errors.add(:base, "User ID you specified doesn't exist.")
    else
      #自分自身に返信を行った場合、エラーとする。
      if user_id == self.in_reply_to
        errors.add(:base, "You can't reply to yourself.")
      else
        #指定したIDのユーザ名が間違っていた場合、エラーとする。
        unless reply_to_user_name_correct?(user)
          errors.add(:base, "User ID doesn't match its name.")
        end
      end
    end
  end

  private
    #アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB.")
      end
    end

    #ユーザ名が正しいかどうかを確認する
    def reply_to_user_name_correct?(user)
      user_name = user.name.gsub(" ", "-")
      content[@index+2, user_name.length] == user_name
    end

    def is_i?(s)
      Integer(s) != nil rescue false
    end
end
