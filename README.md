# Wimdu Coding Challenge

Welcome to the Wimdu Coding Challenge!

When renting out accomodations one has to take care of the fact that
they might not always be available. We have prepared a simple database
schema to model this. One row in the database represents one month,
the days of the month are encoded into a string. In this string, a "0"
stands for "available" and a "1" for "not available". The first
character is the first of the month. Your task is to implement a way
of querying for the availability for a given check-in and check-out
date. Note that it's totally fine for a guest to check in on the day
another guest checks out. Therefore check-out dates are not marked as
"not available" in the days string. Also, it's ok to check out on a
day that's marked as "not available". We don't handle different
accomodations here, it's as if there was just one property, for
simplicity reasons.

We've set up some basic infrastructure with rspec, sqlite and the
sequel gem. Note that the tests are failing. You can use other
libraries for testing or database access if you wish, it's just that
we won't set that up for you.

Try to find a clean and readable solution to the problem. 

Bonus points:
- The class name isn't optimal. Where should availability checking live?
- How would you model availabilities for different accomodations?
- How can we consolidate different sources of availability
  (e.g. external calendars, bookings)?
- Can you suggest a data structure that's better suited for this kind
  of query? What if people are looking for any available property, how
  could you make this perform well?

That's all. Happy hacking!
