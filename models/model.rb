
def get_rating(first,second, third)
  if first=="quality"
    a=1.0
    if second=="price"
      b=0.6667
      if third=="waittime"
        c=0.3333
      else
        c=0
      end
    elsif second=="waittime"
      c=0.6667
      if third=="price"
        b=0.3333
      else
        b=0
      end
    else
      c=0
      b=0
    end
  elsif first=="price"
    b=1.0
    if second=="waittime"
      c=0.6667
      if third=="quality"
        a=0.3333
      else
        a=0
      end
    elsif second=="quality"
      a=0.6667
      if third=="waittime"
        c=0.3333
      else
        c=0
      end
    else
      a=0
      c=0
    end
  elsif first=="waittime"
    c=1.0
    if second =="quality"
      a=0.6667
      if third=="price"
        b=0.3333
      else
        b=0
      end
    elsif second=="price"
      b=0.6667
      if third=="quality"
        a=0.3333
      else
        a=0
      end
    else
      b=0
      a=0
    end
  else
    a=1.0
    b=1.0
    c=1.0
  end
  restaurants={
  "Salty Sow"=>{
    :price=> 29,
    :waittime=> 61,
    :quality=> 94},
  "Fabi + Rosi"=>{
    :price=> 21,
    :waittime=> 61,
    :quality=> 80},
  "McDonald's"=>{
    :price=>86,
    :waittime=>92,
    :quality=>10},
  "Franklin's"=>{
    :price=> 39,
    :waittime=>1,
    :quality=>100}, 
  "Hopdoddy"=>{
    :price=> 54,
    :waittime=>37,
    :quality=>95},
  "Chilantro"=>{
    :price=> 73,
    :waittime=>61,
    :quality=>80},
  "Torchy's Tacos"=>{
    :price=> 67,
    :waittime=>85,
    :quality=>80}
    }
  popular={}
  scores={}
  restaurants.each do |restaurant, values_hash|
    p=values_hash[:price]
    q=values_hash[:quality]
    w=values_hash[:waittime]
    scores["#{restaurant}: &nbsp;&nbsp;"]="#{
      #((a*q*b*p*c*w)**(1/(a+b+c)))
      ((2*a*q+b*p+c*w)/(2*a+b+c)).round(2)} <br><br>"
  end
while scores.length>5
  scores=scores.sort_by{|key,value| value.to_i}.reverse.to_a
  scores.pop
end
return scores
end