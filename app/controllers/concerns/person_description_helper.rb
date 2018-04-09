module PersonDescriptionHelper

  # Returns year_separator variable (getter method)
  #
  # @return [Integer] Number of years used to divide up the timeline into time periods
  def self.year_separator
    @year_separator ||= 10
  end

  def self.sentence_array
    @sentence_array ||= ["#{@person.display_name}"]
  end

  def self.create_sentence
    current_roles.sort_by!(:type)
    current_roles.each do |role|
      unless role.type == 'SeatIncumbency'
        if role == current_roles.first
          @sentence_array.push(" is currently #{role.government_position.name}") if role.type == 'GovernmentIncumbency'
          @sentence_array.push(" is currently #{role.opposition_position.name}") if role.type == 'OppositionIncumbency'
          @sentence_array.push(" is currently a #{t('member').capitalize} #{t('of_the')} #{role.formal_body.name}") if role.type == 'FormalBodyMembership'
        elsif role == current_roles.last
          sentence_array.push(" and #{role.opposition_position.name}") if role.type == 'OppositionIncumbency'
          sentence_array.push(" and the #{role.formal_body.name}") if role.type == 'FormalBodyMembership'
        else
          @sentence_array.push(", #{role.government_position.name}") if role.type == 'GovernmentIncumbency'
          @sentence_array.push(", #{role.opposition_position.name}") if role.type == 'OppositionIncumbency'
          @sentence_array.push(", #{role.formal_body.name}") if role.type == 'FormalBodyMembership'
        end
      end
      if role.type == 'SeatIncumbency'
        if current_roles.include?('GovernmentIncumbency') || current_roles.include?('OppositionIncumbency') || current_roles.include?('FormalBodyMembership')
          @sentence_array.push(". #{@person.pronoun}")
        if role.class == GroupingHelper::GroupedObject || role&.house_of_commons?
          @sentence_array.push(" became an MP in #{l(@sorted_incumbencies.first.start_date, format: :year_only)}.")
        else
          @sentence_array.push(" became a Member of the House of Lords in #{l(@sorted_incumbencies.first.start_date, format: :year_only)}.")
    end
  end


  - current_roles.fetch('GovernmentIncumbency', []).each do |role|
    - sentence_array.push(" is currently #{role.government_position.name}")

  - opposition_roles = current_roles.fetch('OppositionIncumbency', [])
  - opposition_roles.each do |role|
    - if current_roles.include?('GovernmentIncumbency')
      - sentence_array.push(", #{role.opposition_position.name}")
    - else
      - if role == opposition_roles.first
        - sentence_array.push(" is currently #{role.opposition_position.name}")
      - elsif role == opposition_roles.last && !current_roles.include?('FormalBodyMembership')
        - sentence_array.push(" and #{role.opposition_position.name}")
      - else
        - sentence_array.push(", #{role.opposition_position.name}")

  - formal_body_roles = current_roles.fetch('FormalBodyMembership', [])
  - formal_body_roles.each do |role|
    - if current_roles.include?('GovernmentIncumbency') || current_roles.include?('OppositionIncumbency')
      - sentence_array.push(" and #{t('member').capitalize} #{t('of_the')} #{role.formal_body.name}")
    - else
      - if role == formal_body_roles.first
        - sentence_array.push(" is currently a #{t('member').capitalize} #{t('of_the')} #{role.formal_body.name}")
      - elsif role == formal_body_roles.last
        - sentence_array.push(" and the #{role.formal_body.name}")
      - else
        - sentence_array.push(", #{role.formal_body.name}")

  - current_roles.fetch('SeatIncumbency', []).each do |role|
    - if current_roles.include?('GovernmentIncumbency') || current_roles.include?('OppositionIncumbency') || current_roles.include?('FormalBodyMembership')
      - sentence_array.push(". #{@person.pronoun}")
    - if role.class == GroupingHelper::GroupedObject || role&.house_of_commons?
      - sentence_array.push(" became an MP in #{l(@sorted_incumbencies.first.start_date, format: :year_only)}.")
    - else
      - sentence_array.push(" became a Member of the House of Lords in #{l(@sorted_incumbencies.first.start_date, format: :year_only)}.")
  = sentence_array.join


end
