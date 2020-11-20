class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食事制限' },
    { id: 3, name: '運動' },
    { id: 4, name: 'サプリメント等' },
    { id: 5, name: '生活習慣変更' },
    { id: 6, name: 'その他：摂取カロリーを減らす' },
    { id: 7, name: 'その他：消費カロリーを増やす' }
  ]

  include ActiveHash::Associations 
  has_many :diet_method
end