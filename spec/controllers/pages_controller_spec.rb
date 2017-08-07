require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user){User.create!(name: 'test', username: 'test', password: '123')}
  let(:school){School.create!(name: 'test school')}
  let(:unit){Unit.create!(name: 'test unit', school_id: school.id)}

  describe "GET home" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        get :home
      end

      it{expect(response.status).to eq(200)}
    end

    context 'when logged out' do
      before do
        get :home
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end
  end
end
