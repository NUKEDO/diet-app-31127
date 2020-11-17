require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  def generate_long(num)
    str = ''
    string = 'あ'
    num.times do |_i|
      @str = str << string
    end
  end

  describe '新規ユーザー登録' do
    context 'ユーザー登録に成功する' do
      it '全てのカラムに正しく入力されている' do
        expect(@user).to be_valid
      end
      it 'ニックネームが40文字以内なので登録できる' do
        generate_long(40)
        @user.nickname = @str
        expect(@user).to be_valid
      end
      it 'genderがmaleなので登録できる' do
        @user.gender = "male"
        expect(@user).to be_valid
      end
      it 'genderがfemaleなので登録できる' do
        @user.gender = "female"
        expect(@user).to be_valid
      end
      it 'heightが100cm以上300cm以下なので登録できる' do
        @user.height = 300
        expect(@user).to be_valid
      end
      it 'diet_reasonが1024文字以内なので登録できる' do
        generate_long(1024)
        @user.diet_reason = @str
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録に失敗する' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが41文字以上だと登録できない' do
        generate_long(41)
        @user.nickname = @str
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が入っていないと登録できない' do
        @user.email = 'testergmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複していると登録できない' do
        @user.email = 'tester@gmail.com'
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが全角英数字だと登録できない' do
        @user.password = 'ｂｃｄ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみで構成されていると登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみで構成されていると登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordと一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday Select")
      end
      it 'birthdayの「年・月・日」のいずれかが空では登録できない' do
        @user.birthday = '1930----29'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday Select")
      end
      it 'genderが空では登録できない' do
        @user.gender = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
      end
      it 'genderがmaleでもfemaleでもないので登録できない' do
        @user.gender = 'emale'
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender Select")
      end
      it 'heightが空では登録できない' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Height can't be blank")
      end
      it 'heightが100cm未満では登録できない' do
        @user.height = 99
        @user.valid?
        expect(@user.errors.full_messages).to include("Height Enter in centimeters")
      end
      it 'heightが300cm超えでは登録できない' do
        @user.height = 301
        @user.valid?
        expect(@user.errors.full_messages).to include("Height Enter in centimeters")
      end
      it 'heightが小数で入力されていると登録できない' do
        @user.height = 175.5
        @user.valid?
        expect(@user.errors.full_messages).to include("Height Enter in centimeters")
      end
      it 'heightが全角で入力されていると登録できない' do
        @user.height = "１７５"
        @user.valid?
        expect(@user.errors.full_messages).to include("Height Enter in centimeters")
      end
      it 'diet_reasonが空では登録できない' do
        @user.diet_reason = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Diet reason can't be blank")
      end
      it 'diet_reasonが1024文字を超えていると登録できない' do
        generate_long(1025)
        @user.diet_reason = @str
        @user.valid?
        expect(@user.errors.full_messages).to include("Diet reason is too long (maximum is 1024 characters)")
      end
    end
  end
end