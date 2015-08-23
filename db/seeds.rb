# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["RubyConf"].each do |name|
  conference = Conference.find_by(name: name) || Conference.create!(name: name)
  3.times do |day|
    4.times do |hour|
      today        = Time.now
      presented_at =
        Time.mktime(today.year, today.mon, today.day, 9) +
        day  * 24 * 60 * 60                              +
        hour * 2  * 60 * 60
      attributes   = {
        presented_at: presented_at,
        title:        presented_at.strftime("%I %p Talk on %m/%d"),
        speaker:      "Aaron Patterson"
      }
      conference.talks.find_by(attributes) ||
      conference.talks.create!(attributes)
    end
  end
end
