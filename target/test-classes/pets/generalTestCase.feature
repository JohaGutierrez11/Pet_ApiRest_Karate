Feature: Test for API "PetStore"
  Background: Initial Definition
    Given url "https://petstore.swagger.io/v2/"

  @First
  Scenario: Add new pet
    Given path 'pet'
    And request
    """
    {
      "id": 13,
      "category": {
        "id": 0,
        "name": "Dog"
      },
      "name": "Draco",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 13,
          "name": "Draco"
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200

  @Second
  Scenario: Find pet by ID
    Given path 'pet'
    And request
    """
    {
      "id": 28,
      "category": {
        "id": 23,
        "name": "Dog"
      },
      "name": "Draco",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 13,
          "name": "Draco"
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200
    * def idPet = response.id

    Given path 'pet',idPet
    When method GET
    Then status 200


  @Third
  Scenario: Update name and status of a pet

    Given path 'pet'
    And request
    """
    {
      "id": 433,
      "category": {
        "id": 0,
        "name": "Dog"
      },
      "name": "Theo",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 13,
          "name": "Abby"
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200
    * def idPet = response.id

    Given path 'pet'
    And request
    """
    {
      "id": 433,
      "name": "Abby",
      "status": "sold"
    }
    """
    When method POST
    Then status 200

  @Fourth
  Scenario: Find pet by Status

    Given path 'pet'
    And request
    """
    {
      "id": 888,
      "category": {
        "id": 2,
        "name": "Dog"
      },
      "name": "ABBY",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 5,
          "name": "THEO"
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200

    Given path 'pet'
    And request
    """
    {
      "id": 888,
      "name": "THEO",
      "status": "SOLD"
    }
    """
    When method POST
    Then status 200

    Given params {status:reset}
    Given path 'pet/findByStatus'
    When method GET
    Then status 200