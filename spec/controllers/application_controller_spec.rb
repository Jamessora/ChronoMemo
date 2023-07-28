# spec/controllers/application_controller_spec.rb

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
      include Devise::Controllers::Helpers

        def index
          render plain: 'Hello'
        end
    end

    describe "before actions" do
      context "when the controller is a Devise controller" do
        before do
          allow(controller).to receive(:devise_controller?).and_return(true)
        end

        it "calls the :configure_permitted_parameters method" do
          expect(controller).to receive(:configure_permitted_parameters)
          get :index
        end
      end

    describe "configure_permitted_parameters" do
      it "permits first_name and last_name for sign_up" do
        expect(controller).to receive(:devise_parameter_sanitizer).at_least(:once).and_return(double(permit: nil))
        expect(controller.devise_parameter_sanitizer).to receive(:permit).with(:sign_up, keys: %i[first_name last_name terms_and_conditions])
        controller.send(:configure_permitted_parameters)
      end

      it "permits first_name and last_name for account_update" do
        expect(controller).to receive(:devise_parameter_sanitizer).at_least(:once).and_return(double(permit: nil))
        expect(controller.devise_parameter_sanitizer).to receive(:permit).with(:account_update, keys: %i[first_name last_name])
        controller.send(:configure_permitted_parameters)
      end
    end
  end
end
