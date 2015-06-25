class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def average_point
    # 分子 = レストランにレビューを投稿したユーザーから、rateだけを抜き取って配列化し、足し上げている
    # 分母 = レストランにレビューを投稿したユーザーの数
    average = self.users.pluck(:rate).sum / self.users.count
  end

end
