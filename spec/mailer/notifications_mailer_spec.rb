require 'rails_helper'

RSpec.describe NotificationsMailer do

  it 'notificates user when a new evaluation is available to be answered' do
    expect {FactoryGirl.create(:answer_group)}.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end
