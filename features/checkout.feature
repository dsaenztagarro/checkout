Feature: Checkout with discounts

  Scenario Outline: Checkout items
    Given I visit the Cabify store
    When I purchase the items <items>
    Then the total price is <total>

  Examples:
    | items                                                  | total  |
    | VOUCHER, TSHIRT, MUG                                   | 32.50€ |
    | VOUCHER, TSHIRT, VOUCHER                               | 25.00€ |
    | TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT                | 81.00€ |
    | VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT | 74.50€ |
