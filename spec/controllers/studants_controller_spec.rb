require 'rails_helper'

RSpec.describe StudantsController, type: :controller do
  let(:user){User.create!(name: 'test', username: 'test', password: '123')}
  let(:school){School.create!(name: 'test school')}
  let(:unit){Unit.create!(name: 'test unit', school_id: school.id)}
  let(:teacher){Teacher.create!(name: 'test teacher', cpf: '123', birthday: '01/01/1999', unit_id: unit.id)}
  let(:school_class){SchoolClass.create!(number: '1', unit_id: unit.id, teacher_id: teacher.id)}
  let(:responsible){Responsible.create!(name: 'test responsible', cpf: '123', birthday: '01/01/1999')}
  let(:studant){Studant.create!(name: 'test responsible', birthday: '01/01/1999', school_class_id: school_class.id, responsible_ids: [responsible.id])}

  describe "GET index" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        get :index
      end

      it{expect(response.status).to eq(200)}
    end

    context 'when logged out' do
      before do
        get :index
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end
  end

  describe "GET new" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        get :new
      end

      it{expect(response.status).to eq(200)}
    end

    context 'when logged out' do
      before do
        get :new
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end
  end

  describe "GET edit" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        get :edit, params: {id: studant.id}
      end

      it{expect(response.status).to eq(200)}
    end

    context 'when logged out' do
      before do
        get :edit, params: {id: studant.id}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end
  end

  describe "POST create" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        post :create, params: {studant: studant.attributes}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response.status).to redirect_to(studants_path)}
    end

    context 'when logged out' do
      before do
        post :create, params: {studant: studant.attributes}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end

    context 'when receive invalid params' do
      before do
        request.session[:user_id] = user.id
        post :create, params: {studant: {invalid: 'test'}}
      end

      it{expect(response.status).to eq(422)}
    end
  end

  describe "PUT update" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        put :update, params: {id: studant.id, studant: studant.attributes}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response.status).to redirect_to(studants_path)}
    end

    context 'when logged out' do
      before do
        put :update, params: {id: studant.id, studant: studant.attributes}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end

    context 'when receive invalid params' do
      before do
        request.session[:user_id] = user.id
        put :update, params: {id: studant.id, studant: {invalid: 'test'}}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response.status).to redirect_to(studants_path)}
    end
  end

  describe "DELETE destroy" do
    context 'when logged in' do
      before do
        request.session[:user_id] = user.id
        delete :destroy, params: {id: studant.id}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response.status).to redirect_to(studants_path)}
    end

    context 'when logged out' do
      before do
        delete :destroy, params: {id: studant.id}
      end

      it{expect(response.status).to eq(302)}
      it{expect(response).to redirect_to(login_path)}
    end
  end
end
