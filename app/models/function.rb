class Function < ActiveRecord::Base
	validates :emails,
	presence: { message: "入力してください"}
	validates :languages,
	presence: { message: "選択してください"}
	validates :names,
	presence: { message: "入力してください"}
	validates :data,
	presence: { message: "入力してください"}
	validates :descriptions,
	presence: { message: "入力してください"}
end
