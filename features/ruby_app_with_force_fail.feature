@ruby_app @simplecov @force_fail @disable-bundler
Feature: Ruby App Force Fail

  Adding rspec-tracer with simplecov should generate tracer reports and the
  coverage report as well. It should skip some examples when cache found and no
  dependency change is detected.

  Scenario: Ruby App Force Fail
    Given I am working on the project "ruby_app"
    And I use "with_simplecov.rb" as spec helper
    And I want to force fail some of the tests
    When I run specs using "rspec spec"
    Then The RSpecTracer should print the information
      """
        Started RSpec tracer
        RSpec tracer is running 10 examples (actual: 10, skipped: 0)
        does not enroll (No cache) (FAILED - 1)
        enrolls student (No cache)
        does not set name (No cache)
        sets name (No cache)
        does not set email (No cache) (PENDING: Temporarily skipped with xcontext)
        sets email (No cache)
        does not set mobile (No cache) (FAILED - 2)
        sets mobile (No cache) (FAILED - 3)
        does not enroll (No cache)
        enroll student (No cache)
        10 examples, 3 failures, 1 pending
        RSpec tracer is generating reports
        SimpleCov will now generate coverage report (<3 RSpec tracer)
      """
    And The RSpecTracer report should have been generated
    And The last run report should have correct details
      """
      {
        "run_id": "63df6c782675a201fbef23140bd868e2",
        "actual_count": 10,
        "example_count": 10,
        "skipped_examples": 0,
        "failed_examples": 3,
        "pending_examples": 1
      }
      """
    And The all examples report should have correct details
    And The all files report should have correct details
      | file_name             | file_digest                       |
      | /spec/spec_helper.rb  | 3e13379c8b6bce988973c67683d487e1  |
      | /spec/course_spec.rb  | 7564705d731dd1521626cc08baaca4ee  |
      | /spec/student_spec.rb | 822cf79c51add2d042df1e4a46ec98be  |
      | /app/course.rb        | d70df28269ceb244b4a3620644990ffd  |
      | /app/student.rb       | 831c0dc99ff5690f98eb92af131931dd  |
    And The failed example report should have correct details
    And The pending example report should have correct details
    And The dependency report should have correct details
    And The reverse dependency report should have correct details
    And The JSON coverage report should have been generated for "RSpec"
    And the output should contain "31 / 33 LOC (93.94%) covered"
    And The JSON coverage report should have correct coverage for "RSpec"
    When I run `bundle exec rspec spec`
    Then The RSpecTracer should print the information
      """
        Started RSpec tracer
        RSpec tracer is running 4 examples (actual: 10, skipped: 6)
        does not enroll (Failed previously) (FAILED - 1)
        does not set email (Pending previously) (PENDING: Temporarily skipped with xcontext)
        does not set mobile (Failed previously) (FAILED - 2)
        sets mobile (Failed previously) (FAILED - 3)
        4 examples, 3 failures, 1 pending
        RSpec tracer is generating reports
        SimpleCov will now generate coverage report (<3 RSpec tracer)
      """
    And The RSpecTracer report should have been generated
    And The last run report should have correct details
      """
      {
        "run_id": "63df6c782675a201fbef23140bd868e2",
        "actual_count": 10,
        "example_count": 4,
        "skipped_examples": 6,
        "failed_examples": 3,
        "pending_examples": 1
      }
      """
    And The all examples report should have correct details
    And The all files report should have correct details
      | file_name             | file_digest                       |
      | /spec/spec_helper.rb  | 3e13379c8b6bce988973c67683d487e1  |
      | /spec/course_spec.rb  | 7564705d731dd1521626cc08baaca4ee  |
      | /spec/student_spec.rb | 822cf79c51add2d042df1e4a46ec98be  |
      | /app/course.rb        | d70df28269ceb244b4a3620644990ffd  |
      | /app/student.rb       | 831c0dc99ff5690f98eb92af131931dd  |
    And The failed example report should have correct details
    And The pending example report should have correct details
    And The dependency report should have correct details
    And The reverse dependency report should have correct details
    And The JSON coverage report should have been generated for "RSpec"
    And the output should contain "31 / 33 LOC (93.94%) covered"
    And The JSON coverage report should have correct coverage for "RSpec"
    Given I reset force fail
    When I run `bundle exec rspec spec`
    Then The RSpecTracer should print the information
      """
        Started RSpec tracer
        RSpec tracer is running 4 examples (actual: 10, skipped: 6)
        does not enroll (Failed previously) (FAILED - 1)
        does not set email (Pending previously) (PENDING: Temporarily skipped with xcontext)
        does not set mobile (Failed previously)
        sets mobile (Failed previously)
        4 examples, 1 failure, 1 pending
        RSpec tracer is generating reports
        SimpleCov will now generate coverage report (<3 RSpec tracer)
      """
    And The RSpecTracer report should have been generated
    And The last run report should have correct details
      """
      {
        "run_id": "63df6c782675a201fbef23140bd868e2",
        "actual_count": 10,
        "example_count": 4,
        "skipped_examples": 6,
        "failed_examples": 1,
        "pending_examples": 1
      }
      """
    And The all examples report should have correct details
    And The all files report should have correct details
      | file_name             | file_digest                       |
      | /spec/spec_helper.rb  | 3e13379c8b6bce988973c67683d487e1  |
      | /spec/course_spec.rb  | 7564705d731dd1521626cc08baaca4ee  |
      | /spec/student_spec.rb | 822cf79c51add2d042df1e4a46ec98be  |
      | /app/course.rb        | d70df28269ceb244b4a3620644990ffd  |
      | /app/student.rb       | 831c0dc99ff5690f98eb92af131931dd  |
    And The failed example report should have correct details
    And The pending example report should have correct details
    And The dependency report should have correct details
    And The reverse dependency report should have correct details
    And The JSON coverage report should have been generated for "RSpec"
    And the output should contain "32 / 33 LOC (96.97%) covered"
    And The JSON coverage report should have correct coverage for "RSpec"
    When I run `bundle exec rspec spec`
    Then The RSpecTracer should print the information
      """
        Started RSpec tracer
        RSpec tracer is running 2 examples (actual: 10, skipped: 8)
        does not enroll (Failed previously) (FAILED - 1)
        does not set email (Pending previously) (PENDING: Temporarily skipped with xcontext)
        2 examples, 1 failure, 1 pending
        RSpec tracer is generating reports
        SimpleCov will now generate coverage report (<3 RSpec tracer)
      """
    And The RSpecTracer report should have been generated
    And The last run report should have correct details
      """
      {
        "run_id": "63df6c782675a201fbef23140bd868e2",
        "actual_count": 10,
        "example_count": 2,
        "skipped_examples": 8,
        "failed_examples": 1,
        "pending_examples": 1
      }
      """
    And The all examples report should have correct details
    And The all files report should have correct details
      | file_name             | file_digest                       |
      | /spec/spec_helper.rb  | 3e13379c8b6bce988973c67683d487e1  |
      | /spec/course_spec.rb  | 7564705d731dd1521626cc08baaca4ee  |
      | /spec/student_spec.rb | 822cf79c51add2d042df1e4a46ec98be  |
      | /app/course.rb        | d70df28269ceb244b4a3620644990ffd  |
      | /app/student.rb       | 831c0dc99ff5690f98eb92af131931dd  |
    And The failed example report should have correct details
    And The pending example report should have correct details
    And The dependency report should have correct details
    And The reverse dependency report should have correct details
    And The JSON coverage report should have been generated for "RSpec"
    And the output should contain "32 / 33 LOC (96.97%) covered"
    And The JSON coverage report should have correct coverage for "RSpec"