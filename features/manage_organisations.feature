Feature: Manage organisations
  In order to manage organisations
  I must login and check create a
  new organisation

  Scenario Outline:
    Given I create and go to the login page
    And Iam on "/users/sign_out"
    Then Iam on "/users/sign_in"
    Then I fill my email and password
    And a list of countries is created
      |name   | abbreviation|taxes|
      |Bolivia| bo          |[{:name => "Impuesto al Valor Agregado", :rate => 13, :abbreviation => "IVA"}, {:name => "Impuesto a las transacciones", :rate => 1.5, :abbreviation => "IT"}]|
      |Brasil| br|[{:name => "Brasilian", :abbreviation => "bbr", :rate => 15.5}]|

    And a list of currencies is created
      |name     |symbol|
      |boliviano|Bs.   |
      |dolar    |$     |
      |euro     |€     |

    Then Iam on "/organisations/new"
    And I fill data with <name>, <country>, <address>, <phone>, <currency>
    Then I should see organisation with <name>, <country>, <currency>



  Examples:
    |name|country|address|phone|currency|
    |ecuanime|Bolivia|Mallasa|2745620|boliviano|
