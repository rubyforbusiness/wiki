require 'rails_helper'

RSpec.describe Document do
  context "validation" do
    context "title" do
      let(:title) { 'My title' }
      subject {
        described_class.new(title: title)
      }

      it "prevents duplicate titles" do
        create(:document, title: title)
        expect(subject.valid?).to eq(false)
        expect(subject.errors.full_messages).to include("Title has already been taken")
      end


      context "title is nil or empty" do
        [ nil, "" ].each do |title|
          let(:title) { title }
          it "has an error" do
            expect(subject.valid?).to eq(false)
            expect(subject.errors.full_messages).to include("Title can't be blank")
          end
        end
      end
    end
  end
end
