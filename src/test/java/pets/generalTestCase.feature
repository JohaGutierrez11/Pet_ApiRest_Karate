Feature: Test for API "PetStore"
  Background: Initial Definition
    Given url "https://petstore.swagger.io/v2/"
    * def createBody = read('data/createPetBody.json')
    * def updateBody = read('data/updatePetBody.json')

  @First
  Scenario: Add new pet
    Given path 'pet'
    And request createBody
    When method POST
    Then status 200

  @Second
  Scenario: Find pet by ID
    Given path 'pet'
    And request createBody
    When method POST
    Then status 200
    * def idPet = response.id

    Given path 'pet',idPet
    When method GET
    Then status 200


  @Third
  Scenario: Update name and status of a pet

    Given path 'pet'
    And request createBody
    When method POST
    Then status 200
    * def idPet = response.id

    Given path 'pet'
    And request updateBody
    When method POST
    Then status 200

  @Fourth
  Scenario: Find pet by Status

    Given path 'pet'
    And request createBody
    When method POST
    Then status 200

    Given path 'pet'
    And request updateBody
    When method POST
    Then status 200

    Given params {status:sold}
    Given path 'pet/findByStatus'
    When method GET
    Then status 200

    @Fifth
    Scenario: Remove a pet

      Given path 'pet'
      And request createBody
      When method POST
      Then status 200
      * def idPet = response.id

      Given path 'pet',idPet
      When method DELETE
      Then status 200