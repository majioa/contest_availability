class Availability
  def initialize(db)
    @db = db
  end

  def available_between?(checkin, checkout)
    days = map_days_in(checkin, checkout) do |m|
      max_days = days_in_month(m.year, m.month)
      month = @db[:availabilities].filter(year: m.year, month: m.month).first
      month && month[:days][0...max_days] || '0' * max_days
    end

    /^0+$/ =~ days
  end

  private

  def days_in_month(year, month)
    Date.new(year, month, -1).day
  end

  def map_days_in(checkin, checkout)
    borders = (checkin + 1).step(checkout - 1, 1).select{ |d| d.day == 1 }
    months = [checkin].concat(borders)
    days = months.map do |m|
       yield(m) if block_given?
    end

    [ days.first[checkin.day - 1..-1],
      days[1...-1],
      days.last[0...checkout.day - 1] ].join
  end
end
