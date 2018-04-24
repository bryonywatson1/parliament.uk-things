require 'rails_helper'

RSpec.describe 'questions/show', vcr: true do
  before do
  assign(:question,
    double(:question,
      uin: '123456',
      asked_at_date: Time.zone.now - 5.months,
      text: 'Question text1'))

  assign(:asking_person,
    double(:asking_person,
      full_name: 'Name1 Name2'))

  assign(:answering_person,
    double(:answering_person,
      full_name: 'Name3 Name4'))

  assign(:constituency,
    double(:constituency,
      name: 'Kingston upon Thames'))

  assign(:answering_body,
    double(:answering_body,
      name: 'Department of Health'))

  assign(:answer,
    double(:answer,
      text: 'Answer text1',
      answer_given_date: Time.zone.now - 4.months))

  assign(:answering_person_government_incumbency,
    double(:answering_person_government_incumbency,
    current?:  false,
    end_date:  Time.zone.now - 3.months))

    assign(:asking_person_seat_incumbency,
      double(:asking_person_seat_incumbency,
      current?:  false,
      end_date:  Time.zone.now - 2.months))

  assign(:government_position,
    double(:government_position,
      name: 'Minister'))

      render

    end


  context 'question' do
    it 'will render the correct question uin' do
      expect(rendered).to match(/123456/)
    end

    it 'will render the correct question text' do
      expect(rendered).to match(/Question text1/)
    end

    it 'will render the correct question asked at date' do
      expect(rendered).to match(/24 Nov 2017/)
    end
  end

  context 'asking_person' do
    it 'will render the correct asking person full name' do
      expect(rendered).to match(/Name1 Name2/)
    end
  end

  context 'asking_person_seat_incumbency' do
    it 'will render the correct asking person incumbency end date' do
      expect(rendered).to match(/until 24 Feb 2018/)
    end
  end

  context 'constituency' do
    it 'will render the correct asking person constituency' do
      expect(rendered).to match(/Kingston upon Thames/)
    end
  end

  context 'answering_body' do
    it 'will render the correct answering body' do
      expect(rendered).to match(/Department of Health/)
    end
  end

  context 'answer' do
    it 'will render the correct answer text' do
      expect(rendered).to match(/Answer text1/)
    end

    it 'will render the correct answer given date' do
      expect(rendered).to match(/24 Dec 2017/)
    end
  end

  context 'answering_person' do
    it 'will render the correct answering person full name' do
      expect(rendered).to match(/Name3 Name4/)
    end
  end

  context 'government_position' do
    it 'will render the correct government position' do
      expect(rendered).to match(/Minister for Department of Health/)
    end
  end

  context 'answering_person_government_incumbency' do
    it 'will render the correct answering person government incumbency end date' do
      expect(rendered).to match(/until 24 Jan 2018/)
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
