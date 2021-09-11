require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase
  def test_survey_must_has_username
    
    # Arrange
    survey1 = Survey.new
    survey2 = Survey.new
    
    # Act
    survey1.username = ''
    survey2.username = nil
    
    # Assert
    assert_equal(survey1.valid?, false)
    assert_equal(survey2.valid?, false)
  end


  def test_survey_has_a_career
    
    # Arrange
    career = Career.new
    survey = Survey.new    
    
    # Act
    survey.career_id = career.id
    
    # Assert
    assert_equal(survey.valid?, false)
    
  end


  def test_survey_has_many_responses
    
    #Arrange
    career = Career.create(name: 'test')
    question = Question.create(name: 'name_est', description: 'test', number: 1, type: 'test')
    choice = Choice.create(text: 'choice_test', question_id: question.id)
    survey = Survey.create(username: 'Pepe', career_id: career.id)
    response1 = Response.create(survey_id: survey.id, question_id: question.id, choice_id: choice.id)
    response2 = Response.create(survey_id: survey.id, question_id: question.id, choice_id: choice.id)
    response3 = Response.create(survey_id: survey.id, question_id: question.id, choice_id: choice.id)

    #Assert
    assert_equal(survey.responses.count, 3)

  end
end