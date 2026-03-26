class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  validates :user_id, uniqueness: true # 追加
  # 実業務の場合はDB側にもユニーク制約を付けておくと安全です。
  # このバリデーションは、1人のユーザーが複数のカートを持たないようにする目的です。
end
