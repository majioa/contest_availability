require "spec_helper"

describe Availability do
  before do
    db[:availabilities].insert(
      year: 2015, month: 1,
      #      1234567890123456789012345678901
      days: "1111111000000000000000000000000")
    db[:availabilities].insert(
      year: 2015, month: 6,
      #      123456789012345678901234567890
      days: "000000000000000000001111111100")
    db[:availabilities].insert(
      year: 2015, month: 7,
      #      1234567890123456789012345678901
      days: "0000111111100000100000000000000")
    db[:availabilities].insert(
      year: 2015, month: 12,
      #      1234567890123456789012345678901
      days: "0000000000000000000111100000000")
    db[:availabilities].insert(
      year: 2016, month: 1,
      #      1234567890123456789012345678901
      days: "0000000000000000000000000000000")
    db[:availabilities].insert(
      year: 2016, month: 2,
      #      1234567890123456789012345678901
      days: "0000000000000001000000000000000")
    db[:availabilities].insert(
      year: 2016, month: 3,
      #      1234567890123456789012345678901
      days: "0000000011111111111111111111111")
  end

  subject(:availability) { described_class.new(db) }

  describe "#available_between?" do
    it {
      is_expected.to(
        be_available_between(
          Date.new(2015, 6, 29),
          Date.new(2015, 7, 5)))
    }

    # checkin is blocked
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2015, 6, 28),
          Date.new(2015, 7, 5)))
    }

    # checkout is blocked
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2015, 6, 29),
          Date.new(2015, 7, 6)))
    }

    # blocked as 2015-07-17 is taken
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2015, 7, 15),
          Date.new(2015, 7, 19)))
    }

    # rolls over to new year
    it {
      is_expected.to(
        be_available_between(
          Date.new(2015, 12, 24),
          Date.new(2016, 1, 2)))
    }

    # checkin is blocked
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2015, 12, 22),
          Date.new(2016, 1, 2)))
    }

    it {
      is_expected.to(
        be_available_between(
          Date.new(2015, 12, 26),
          Date.new(2016, 2, 2)))
    }

    # blocked by 2016-02-16
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2016, 1, 27),
          Date.new(2016, 3, 5)))
    }

    # takes year between checkin and checkout into account
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2014, 11, 15),
          Date.new(2017, 1, 15)))
    }

    # no DB entry for 2015-08, considered to be all available
    it {
      is_expected.to(
        be_available_between(
          Date.new(2015, 7, 18),
          Date.new(2015, 8, 2)))
    }

    # checkin is blocked
    it {
      is_expected.to_not(
        be_available_between(
          Date.new(2015, 7, 17),
          Date.new(2015, 8, 2)))
    }
  end
end
