[![Build Status](https://travis-ci.org/dsaenztagarro/checkout.svg?branch=cabify)](https://travis-ci.org/dsaenztagarro/checkout)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/checkout/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/checkout)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/checkout/badge.svg?branch=cabify&service=github)](https://coveralls.io/github/dsaenztagarro/checkout?branch=cabify)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/checkout.svg)](https://gemnasium.com/dsaenztagarro/checkout)

# checkout

Branches
--------

Exercise has been solved in two flavors:

- [master][1]: My default implementation! It modifies the expected interface in 
    order to avoid any kind of coupling in the implementation. Winner choice!

- [cabify][2]: Just the implementation you were looking for.

**IMPORTANT**

In order to see implementations in action just take a look at acceptance tests!


Rake tasks
----------

- `test:acceptance`: run acceptance tests with `cucumber`
- `test:unit`: run unit tests with `rspec`
- `test:all`: run all tests 
- `quality_metrics:rubocop`: run rubocop
- `quality_metrics:reek`: run reek
- `quality_metrics:cane`: run cane
- `quality_metrics:all`: run all quality metric tasks

Coverage
--------

To generate locally coverage report:

```
export COVERAGE=true
bundle exec rake test:all
```

Documentation
-------------

1. Run local documentation server: `yard server`

2. [Check documentation](http://localhost:8808)


[1]: https://github.com/dsaenztagarro/checkout/tree/master
[2]: https://github.com/dsaenztagarro/checkout/tree/cabify
