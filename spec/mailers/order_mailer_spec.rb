require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "new_order_notification" do
    let(:mail) { OrderMailer.new_order_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("New order notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
