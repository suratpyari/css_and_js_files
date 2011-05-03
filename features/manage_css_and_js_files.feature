@css_and_js_files
Feature: Css And Js Files
  In order to have css_and_js_files on my website
  As an administrator
  I want to manage css_and_js_files

  Background:
    Given I am a logged in refinery user
    And I have no css_and_js_files

  @css_and_js_files-list @list
  Scenario: Css And Js Files List
   Given I have css_and_js_files titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of css_and_js_files
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @css_and_js_files-valid @valid
  Scenario: Create Valid Css And Js File
    When I go to the list of css_and_js_files
    And I follow "Add New Css And Js File"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 css_and_js_file

  @css_and_js_files-invalid @invalid
  Scenario: Create Invalid Css And Js File (without name)
    When I go to the list of css_and_js_files
    And I follow "Add New Css And Js File"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 css_and_js_files

  @css_and_js_files-edit @edit
  Scenario: Edit Existing Css And Js File
    Given I have css_and_js_files titled "A name"
    When I go to the list of css_and_js_files
    And I follow "Edit this css_and_js_file" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of css_and_js_files
    And I should not see "A name"

  @css_and_js_files-duplicate @duplicate
  Scenario: Create Duplicate Css And Js File
    Given I only have css_and_js_files titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of css_and_js_files
    And I follow "Add New Css And Js File"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 css_and_js_files

  @css_and_js_files-delete @delete
  Scenario: Delete Css And Js File
    Given I only have css_and_js_files titled UniqueTitleOne
    When I go to the list of css_and_js_files
    And I follow "Remove this css and js file forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 css_and_js_files
 