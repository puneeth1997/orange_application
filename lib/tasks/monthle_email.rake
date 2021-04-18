task :monthly_email => :environment do
  puts "its your points"
  user = User.all
  user.each do |t|
    puts "#{t.points}"
    TestMailer.points_email(t).deliver
  end
end

task :yearly_mail => :environment do
  users = User.all
  c = {"5y" => 100, "10y" => 200, "15y" => 300, "20y" => 400, "25y" => 500, "30y" => 600}
  users.each do |t|
    a = Date.current.year - t.doj.year
    if t.doj.month > Date.current.month
      a = a-1
    end 
    #b=a%5
    if a == 1 && t.doj.month == Date.current.month
      puts "Thanks for working #{a} years with us"
      TestMailer.years_email(t).deliver
    end
    if a%5 == 0 && t.doj.month == Date.current.month
      t.points = t.points + c["#{a}y"]
      t.save
      puts "Thanks for working #{a} years with us"
      puts t.points
      TestMailer.years_email(t).deliver   
    end
  end
end      
