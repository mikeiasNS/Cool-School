require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user){User.create!(name: 'test', username: 'test', password: '123')}

  describe "GET new" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        get :new
      end

      it{expect(response).to redirect_to(root_path)}
    end

    context 'when logged out' do
      before do
        get :new
      end

      it{expect(response.status).to eq(200)}
    end
  end

  describe "POST create" do
    context 'when credentials valid' do
      before do
        post :create, params: {username: user.username, password: '123'}
      end

      it{expect(response).to redirect_to(root_path)}
    end

    context 'when password invalid' do
      before do
        post :create, params: {username: user.username, password: '1234'}
      end

      it{expect(response.status).to eq(401)}
    end

    context 'when username invalid' do
      before do
        post :create, params: {username: 'bla', password: '123'}
      end
      
      it{expect(response.status).to eq(401)}
    end

    context 'when username and passwotd invalids' do
      before do
        post :create, params: {username: 'bla', password: '1234'}
      end
      
      it{expect(response.status).to eq(401)}
    end
  end
end
