# spec/controllers/application_controller_spec.rb

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "before actions" do
    it "calls the :configure_permitted_parameters method before Devise actions" do
      is_expected.to use_before_action(:configure_permitted_parameters)
        .before_action(:authenticate_user!)
        .only(:devise_controller?)
    end

    it "calls the :authenticate_user! method before all actions" do
      is_expected.to use_before_action(:authenticate_user!)
        .before_action(:process_action)
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
