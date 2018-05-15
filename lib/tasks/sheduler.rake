desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end

task :send_reminders => :environment do
  list_hikers = Array.new
  tomorrow    = Date.today + 1
  trips       = Trip.where(date: tomorrow)
  puts trips
  trips.each do |trip|
    # p trip.submissions
    trip.submissions.each do |submission|
      p user_to_remind = submission.user.email
      UserMailer.send_reminders(user_to_remind).deliver_now
    end
  end
  # trouver toutes les submissions accepted sur ces trips
  # prendre tous les user de ces submissions
  # les retourver dans la console
end

