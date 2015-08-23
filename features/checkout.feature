Feature: Checkout with discounts

  Background:
    Given a physical store
    And it sells this products:
      | code    | name              | price |
      | VOUCHER | Cabify Voucher    | 5€    |
      | TSHIRT  | Cabify T-Shirt    | 20€   |
      | MUG     | Cabify Coffee Mug | 7.5€  |
    And it has 2-for-1 discounts on:
      | code    |
      | VOUCHER |
    And it has discounts in bulk purchases:
      | code   | min_num | price_per_unit |
      | TSHIRT | 3       | 19€            |
    And I visit the store

  Scenario Outline: Checkout items
    When I purchase the items <items>
    Then the total price is <total>

  Examples:
    | items                                                  | total  |
    | VOUCHER, TSHIRT, MUG                                   | 32.50€ |
    | VOUCHER, TSHIRT, VOUCHER                               | 25.00€ |
    | TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT                | 81.00€ |
    | VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT | 74.50€ |
