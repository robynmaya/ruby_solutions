require 'csv'

class StudyPlanGenerator # 4 methods to test : build_plan_for_each_student,
  # plan_for_student, convert_to_original_structure, run
  def self.import_from_csv(domain_order_file, student_tests_file)
    # files are now ruby data structure and stored in local variables
    domain_order = DomainOrder.import_from_csv(domain_order_file) # turn into Ruby ds
    test_results = TestResults.import_from_csv(student_tests_file) # turn into Ruby ds
    s = allocate # allocate space and instantiate a study plan generator object
    s.send(:initialize, domain_order, test_results) # send( ) is an instance method of the Object class.
    s # the first argument is the name of the method in a symbol syntax, the remaining are arguments passed in
  end

  def initialize(domain_order, test_results)
    @domain_order = domain_order # store into an instance variable
    @test_results = test_results # store into an instance variable
  end

  def build_plan_for_each_student
    final_plans = {}
    @test_results.each do |name, courses| # call custom each
      # call plan_for_student with array of Course objects
      final_plans[name] = plan_for_student(courses).map(&:to_s) # deleted self
    end
    final_plans
  end

  # student_test_courses array of Course
  # returns array of Course
  def plan_for_student(student_test_courses) # an array of Course objects
    study_plan = [] # array of course objects
    @domain_order.each_as_courses do |potential_course| # course object
      # student_test_courses is an array of course objects
      student_test_courses.each do |test_course| # course object
        if test_course.prerequisite_of? potential_course
          study_plan.push(potential_course)
          next
        end
      end
    end
    study_plan.take(5) # each student only needs up to five units
  end

  def convert_to_original_structure(final_raw_data)
    final_raw_data.to_a.map(&:flatten)
  end

  def run
    final_plans = build_plan_for_each_student # self is deleted
    final_array = convert_to_original_structure(final_plans)
    final_csv = final_array.map(&:to_csv).join

    puts final_csv

    File.write("study_plan.csv", final_csv)
  end
end

class TestResults # 2 methods to test : each, make_header
  # Custom constructor for importing from CSV
  def self.import_from_csv(file_name)
    t = allocate
    t.send(:initialize, CSV.read(file_name))
    t
  end

  # Construct from raw array of arrays (test results for each student)
  def initialize(test_results_arr)
    # Hash of { Student Name => Student Results }
    @test_results = Hash.new{ |h,k| h[k] = []}
    # take the first item of the array and store into a new variable (header)
    header = make_header(test_results_arr).drop(1) # self is deleted
    test_results_arr.shift # drop the first item of the array / remove it completely

    # zip works because the order of the domain from t array and the grade
    # from header are the same
    test_results_arr.each do |t|
      # the following will turn the array of grade+course that belongs to the key student, into a Course object.
      # @test_results = Course, Course, Course of one student in a hash
      @test_results[t[0]] = t[1..-1].zip(header).map do |pair| # pair of grade and course e.g ['2', 'RF']
        # turn every element from the value array into Course object
        Course.new(pair[0], pair[1]) # one of the two times we create Course object
      end
    end
  end

  def each # used on line 21
    # iterate for every name + courses pair
    @test_results.each do |name, courses| # a hash of string (student name) and array of course objects
      yield name, courses
    end
  end

  def make_header(tests) # used on line 70
    tests.take(1).flatten
  end
end

class DomainOrder # 1 method to test : each_as_courses
  # Custom constructor for importing from CSV
  def self.import_from_csv(file_name)
    d = allocate
    d.send(:initialize, CSV.read(file_name))
    d
  end

  def initialize(domain_order_arr)
    @levels = [] # will be an array of hashes
    domain_order_arr.each do |level| # ['K', 'RF', 'RI']
      @levels.push({
        grade: level[0],
        domains: level[1..-1]
      })
    end
  end

  def each_as_courses
    @levels.each do |level| # a hash
      level[:domains].each do |domain| # example : RF
        yield Course.new(level[:grade], domain) # will become potential course
      end
    end
  end
end

class Course # 3 methods to test : to_s, prerequisite_of, convert_grade_to_int
  attr_accessor :grade, :domain

  def initialize(grade, domain)
    self.grade = convert_grade_to_int grade # self is used to access setter method of grade=
    self.domain = domain # self is used to access setter method of domain=
  end

  def to_s
    if @grade == -1
      "PK.#{ @domain }"
    elsif @grade == 0
      "K.#{ @domain}"
    else
      "#{ @grade.to_s }.#{ @domain }"
    end
  end

  def prerequisite_of?(course) # it will turn True if both Courses are the same
    @grade <= course.grade && @domain == course.domain
  end

  def convert_grade_to_int(v)
    if v == "PK"
      -1
    elsif v == "K"
      0
    else
      v.to_i
    end
  end

  def ==(course)
    @grade == course.grade && @domain == course.domain
  end
end

if __FILE__==$0 # make sure that this file does not run unless ran on this file
  # 2 methods run consequtively : import_from_csv & run
  StudyPlanGenerator.import_from_csv('domain_order.csv', 'student_tests.csv').run
end
