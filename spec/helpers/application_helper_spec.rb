require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#label_class' do
    it 'returns the label class string' do
      expect(helper.label_class).to eq("block text-sm font-medium leading-6 text-gray-900")
    end
  end

  describe '#input_class' do
    it 'returns the input class string' do
      expect(helper.input_class).to eq("block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6")
    end
  end

  describe '#form_button_class' do
    it 'returns the form button class string' do
      expect(helper.form_button_class).to eq("flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600")
    end
  end

  describe '#checkbox_class' do
    it 'returns the checkbox class string' do
      expect(helper.checkbox_class).to eq("h-5 w-5 rounded-md border-gray-200 bg-white shadow-sm")
    end
  end
end
