require 'spec_helper'

Capybara.app = Rack::Builder.new do
  eval(File.read(File.expand_path('./config.ru')))
end

describe '#show' do
  before { visit '/' }
  subject { page }

  it 'renders' do
    expect(page).to have_title('Page')
    expect(page).to have_content("Hi, I'm the layout")
    expect(page).to have_content("Hi, I'm a cell!")
  end
end
