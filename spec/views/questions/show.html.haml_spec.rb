require 'rails_helper'

RSpec.describe 'questions/show', vcr: true do
  context 'question' do
    it 'will render the correct question title' do
      assign(:question,
        double(:question,
          uin: '123456',
          text: 'Question text',
          asked_at_date: Time.zone.now - 2.months))
      render
      expect(rendered).to match(/Question 123456/)
    end

    it 'will render the correct question text' do
      assign(:question,
        double(:question,
          uin: '123456',
          text: 'Question text',
          asked_at_date: Time.zone.now - 2.months))
      render
      expect(rendered).to match(/Question text/)
    end

    it 'will render the correct question asked at date' do
      assign(:question,
        double(:question,
          uin: '123456',
          text: 'Question text',
          asked_at_date: Time.zone.now - 2.months))
      render
      expect(rendered).to match(/1 Mar 2018/)
    end
  end

  context 'asking_person' do
    it 'will render the correct asking person full name' do
      assign(:asking_person,
        double(:asking_person,
          full_name: 'First Name Last Name'))
      render
      expect(rendered).to match(/First Name Last Name/)
    end
  end

  context 'constituency' do
    it 'will render the correct asking person constituency' do
      assign(:constituency,
        double(:constituency,
          name: 'Kingston upon Thames'))
      render
      expect(rendered).to match(/Mp for Kingston upon Thames/)
    end
  end

  context 'answering_body' do
    it 'will render the correct answering body' do
      assign(:answering_body,
        double(:answering_body,
          name: 'Department for Health'))
      render
      expect(rendered).to match(/Department for Health/)
    end
  end

  context 'answer' do
    it 'will render the correct answer text' do
      assign(:answer,
        double(:answer,
          text: 'Answer text',
          answer_given_date: Time.zone.now - 2.months))
      render
      expect(rendered).to match(/Answer text/)
    end

    it 'will render the correct answer given date' do
      assign(:answer,
        double(:answer,
          text: 'Answer text',
          answer_given_date: Time.zone.now - 2.months))
      render
      expect(rendered).to match(/1 Apr 2018/)
    end
  end

  context 'answering_person' do
    it 'will render the correct answering person full name' do
      assign(:answering_person,
        double(:answering_person,
          full_name: 'Jo Smith'))
      render
      expect(rendered).to match(/Jo Smith/)
    end
  end

  context 'government_position' do
    it 'will render the correct government position' do
      assign(:government_position,
        double(:government_position,
          name: 'Minister'))
      render
      expect(rendered).to match(/Minister/)
    end
  end

  context 'answering_person_government_incumbency' do
    it 'will render the correct answering person government incumbency end date' do
      assign(:answering_person_government_incumbency,
        double(:answering_person_government_incumbency,
        current?:  false,
        end_date:  Time.zone.now - 2.months))
      render
      expect(rendered).to match(/Minister for Department of Health until 2018/)
    end
  end






  # context '@party.member_count > 0' do
  #   before do
  #     assign(:party, double(:party, name: 'Conservative', graph_id: 'jF43Jxoc', member_count: 10, current?: true))
  #     render
  #   end
  #
  #   context 'links' do
  #     it 'will render link to party_members_current_path' do
  #       expect(rendered).to have_link('Current members', href: party_members_current_path('jF43Jxoc'))
  #     end
  #
  #     it 'will render link description' do
  #       expect(rendered).to match(/View all current Conservative members/)
  #     end
  #   end
  # end
  #
  # context '@party.member_count == 0' do
  #   before do
  #     assign(:party, double(:party, name: 'Conservative', graph_id: 'jF43Jxoc', member_count: 0, current?: false))
  #     render
  #   end
  #
  #   context 'links' do
  #     it 'will render link to party_members_path' do
  #       expect(rendered).to have_link('View all former Conservative members', href: party_members_path('jF43Jxoc'))
  #     end
  #   end
  # end
end
