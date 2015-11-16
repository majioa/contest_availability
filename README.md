# Wimdu Coding Challenge

Welcome to the Wimdu Coding Challenge!

When renting out accommodations one has to take care of the fact that
they might not always be available. We have prepared a simple database
schema to model this. One row in the database represents one month,
the days of the month are encoded into a string. In this string, a "0"
stands for "available" and a "1" for "not available". The first
character is the first of the month. Your task is to implement a way
of querying for the availability for a given check-in and check-out
date. Note that it's totally fine for a guest to check in on the day
another guest checks out. Therefore check-out dates are not marked as
"not available" in the days string. Also, it's ok to check out on a
day that's marked as "not available", which would be the day another
guest is going to check in. When there's no entry in the database for
a given month the accommodation is available for that time period.

We don't handle different accommodations here, it's as if there was
just one property, for simplicity reasons.

We've set up some basic infrastructure with rspec, sqlite and the
sequel gem. After installing all dependencies you should be able to
run the tests with either `rake` or `rspec`. Note that they are
failing.

You should be able to complete the task in around 1h. If it takes you
longer, rethink your approach: there might be a simpler way.

But most importantly: TRY TO FIND A CLEAN AND READABLE SOLUTION TO THE
PROBLEM!

## Bonus questions

- Q: The class name `Availability` isn't optimal. Where would the
  `#available_between?` method live in a more realistic application?
  What would be the class name?

  A: It can be a `Room` or even `Bed`, or something what can be shared,
  may be a `House`

- Q: This example is too simplistic. How would you extend the data model
  to support more than one accommodation?

  A: That can be an additional fields: count of beds in a room, for room class,
  a number of a room, an address or just number of a building with a Bed/Room.
  Also it can include a features for a room like wifi. User who reserved a room =)

- Q: In a real-world setting there are several sources for availability,
  e.g. a user might block certain dates on the platform, or some dates
  are already booked, or the same accommodation might be listed on a
  competitor's platform and have a booking there. How can we
  consolidate these different sources of availability? How can we
  model this so they're easy to combine?

  A: In the existing model that kinds can be makrd with numbers `2,3. etc`,  that
  describes a kind of unavaiability

- Q:Can you suggest a data structure that makes finding available
  accommodations for a given set of check-in and check-out dates easy
  and fast? What would be the trade-offs?

  A: not quite understood question what is the data structure? Additional? An other?
  If another, it can be a bitfields for example for (0/1) kind of availability.
  Generally the question is too broad.

## Submitting your work

Commit your changes and send us your results as a git bundle. Here's
how to do that:

    $ git bundle create jane-schmoe-availabilities.bundle master

Just to check if stuff worked, you can clone from this file with

    $ git clone -b master jane-schmoe-availabilities.bundle

That's all. Happy hacking!
