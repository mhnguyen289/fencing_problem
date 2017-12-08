teams_one = File.read("files/MEconflicts.csv")
teams_two = File.read("files/MEentries.csv")
teams_three = File.read("files/MEshort.csv")

  p fencer =  teams_one.gsub(/\r?\n/, ',').gsub(/ ,/, ',').gsub(/, /, ',').split(',').each_slice(4).to_a

def sort_fencers_by_level(fencer_arr)
  fencer_arr.each do |d| 
        level = d[3].split('',2)  
      d.pop
      d << level
        d.flatten
        end
  new_team = []
  new= fencer_arr.sort_by{|t| [t[3][0],-t[3][1].to_i]}
    new.each{|r| new_team << r.flatten}
  new_team
    sorted_team = []
    new_team.each do |e|  
      level = e[3..4].join 
      t=  e.slice(0..2) << level
      sorted_team << t
    end
    sorted_team
  end
  sorted_fencers = sort_fencers_by_level(fencers)
  
def num_of_pools(arr)
  num = arr.length
  pool= []
  five = (1..100).select{|i|i % 5 == 0}
  six = (1..100).select{|i|i % 6 == 0}
  seven = (1..100).select{|i|i % 7 == 0}
  eight = (1..100).select{|i|i % 8 == 0}
  if (1..100).select{|i|i % 6 == 0 || i % 7 == 0 || i % 8 == 0}.include?(num)
    if num % 8 == 0 
      new_num = 8
      return num/8=>8
    elsif
      num % 7 == 0 
      new_num = 7
      return num/7
    elsif 
      num % 6 == 0 
      new_num = 6
      return num/6
    end
    elsif 
    arr = seven+eight
    if !!arr.uniq.combination(2).detect { |a, b| a + b == num }
      for i in seven
      for e in eight
        if i + e == num
            pool.push([i/7,7],[e/8,8])
          # return "#{i/7}" +" pool(s) of 7 and " + "#{e/8}"+ " pool(s) of 8"
          end
        end
      end
      pool
      elsif
      arr = six+seven
    if !!arr.uniq.combination(2).detect { |a, b| a + b == num }
    for i in six 
      for e in seven
      if i + e == num
        pool.push([i/6,6],[e/7,7])
        # return "#{i/6}" +" pool(s) of 6 and " + "#{e/7}"+ " pool(s) of 7"
        end
      end
    end
    pool
  else    
    arr = five+six
    if !!arr.uniq.combination(2).detect { |a, b| a + b == num }
      for i in five
        for e in six
        if i + e == num
          pool.push([i/5,5],[e/6,6])
          # return "#{i/5}" +" pool(s) of 5 and " + "#{e/6}"+ " pool(s) of 6"
          end
        end
      end
    end
  pool
  end
end    
end
end

   num_arr = num_of_pools(sorted_fencers)
    
    if num_arr.is_a? Array
      sum = 0
      num_arr.each{|e|  sum += e[0]}
      num_arr = sum
    else
      num_arr
    end
  
def sort_team(pool_num,sorted_arr)
pool_1 = []
pool_2 = []
pool_3 = []
y = 1
x = 1

  sorted_arr.each do |i|
    y *= x == 0 || x == pool_num + 1 ? -1 : 1;
    x = x == 0 ? 1 : x; x = x == pool_num + 1 ? pool_num : x; 
    # puts "#{i[1]}" + " is in pool " + "#{x}"
    x+= y;
    
      if  x-y == 1
        pool_1 << i[1]
      elsif x-y == 2
        pool_2 << i[1]
      elsif x-y == 3
        pool_3 << i[1]
      end
    end    
  pool_1.each{|e| puts "#{e}" + "is in pool 1"}
  pool_2.each{|e| puts "#{e}" + "is in pool 2"}
  pool_3.each{|e| puts "#{e}" + "is in pool 3"}
end
sort_team(num_arr,sorted_fencers)
