require 'test/unit'
require 'study_plan'

class TestCourse < Test::Unit::TestCase

  def test_to_s
    course = Course.new("K", "RF")
    assert_equal "K.RF", course.to_s
  end

  def test_prerequisite_of
    course = Course.new("K", "RF")
    potential_course = Course.new("1", "RF")
    assert course.prerequisite_of? potential_course
  end

  def test_convert_grade_to_int
    v = "1"
    assert_equal 1, v.to_i
  end
end

class TestDomainOrder < Test::Unit::TestCase
  def test_each_as_courses
    domain_order = DomainOrder.new([
      ["K", "C++", "RL"],
      ["1", "C++", "RL"]
    ])
    expected = [
      Course.new("K", "C++"),
      Course.new("K", "RL"),
      Course.new("1", "C++"),
      Course.new("1", "RL")
    ]
    output = []
    domain_order.each_as_courses do |course|
      output.push course
    end
    assert_equal expected, output
  end
end

class TestTestResults < Test::Unit::TestCase
  def test_each
    test_result = TestResults.new([
      ["Student Name", "RF", "C++"],
      ["Joe", "K", "1"]
    ])
    expected = [
      Course.new("K", "RF"),
      Course.new("1", "C++")
    ]
    output = []
    test_result.each do |name, courses|
      output.replace courses
    end
    assert_equal expected, output
  end

  def test_make_header
    test_results = TestResults.new([])
    tests = [["Student Name", "RF", "RL", "RI", "L"],
            ["Albin Stanton", "2", "3", "K", "3"],
            ["Erik Purdy", "3", "1", "1", "1"]]
    assert_equal ["Student Name", "RF", "RL", "RI", "L"], test_results.make_header(tests)
  end
end

class TestStudyPlanGenerator < Test::Unit::TestCase
  def test_build_plan_for_each_student
    test_results =  TestResults.new([
      ["Student Name", "RF", "RL", "RI", "L"],
      ["Albin Stanton", "2", "3", "K", "3"]
    ])
    domain_order = DomainOrder.new([
      ["K", "RF", "RL", "RI"],
      ["1", "RF", "RL", "RI"],
      ["2", "RF", "RI", "RL", "L"],
      ["3", "RF", "RL", "RI", "L"],
      ["4", "RI", "RL", "L"],
      ["5", "RI", "RL", "L"],
      ["6", "RI", "RL"]
    ])

    study_plan = StudyPlanGenerator.new(domain_order, test_results)

    final_plans = {"Albin Stanton" => ["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]}
    assert_equal study_plan.build_plan_for_each_student, final_plans
  end


  def test_plan_for_student
    domain_order = DomainOrder.new([
      ["K", "RF", "RL", "RI"],
      ["1", "RF", "RL", "RI"],
      ["2", "RF", "RI", "RL", "L"],
      ["3", "RF", "RL", "RI", "L"],
      ["4", "RI", "RL", "L"],
      ["5", "RI", "RL", "L"],
      ["6", "RI", "RL"]
    ])

    study_plan = StudyPlanGenerator.new(domain_order, nil)

    student_result = [
      Course.new("K","RF"),
      Course.new("4","RL"),
      Course.new("2","L"),
      Course.new("5","RI")
    ]

    expected_plan = [
      Course.new("K","RF"),
      Course.new("1","RF"),
      Course.new("2","RF"),
      Course.new("2","L"),
      Course.new("3","RF")
    ]

    assert_equal expected_plan, study_plan.plan_for_student(student_result)
  end

  def test_convert_to_original_structure
    final_array = [["Albin Stanton", "K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]]
    final_raw_data = {"Albin Stanton" => ["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]}

    study_plan = StudyPlanGenerator.new(nil, nil)

    assert_equal final_array, study_plan.convert_to_original_structure(final_raw_data)
  end

end
