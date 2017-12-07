# Ruby note

### Refer

- https://nodejust.com/ruby-program-basic-tutorials/zh-cn/

- test your ruby on line (https://repl.it/repls/OutgoingSecondhandBighorn)

- ruby 中文論壇(http://railsfun.tw/)

### Boolean
```
equal `==`
not equal `!=`
greater and equal `>=`
less and equial `<=`

NOT `!`
AND `&&`
OR `||`
```

### if 
```
if ... end

if ... else ... end

if ... elsif ... else ...end # why no `e`
```
### Ruby's loop
- while 
```
# while will end when condition become false

counter = 1

while counter < 6
    puts "Hello #{counter}"
    counter += 1
end
```

- until
```
# until will end when condition become true

counter = 1

until counter > 5
    puts "Hello #{counter}"
    counter += 1
end
```

- for
```
# use `for` when you sure your repeat times

for counter in 1..5
    puts "Hello #{counter}"
end
```

- Next
```
# `next` is use for jump certain loop in (`While`, `Until`, `For`, or some `iterators`)

for i in 1..5
 next if i % 2 == 0
 print i
end

# Even number will not be printed.
```

### iterators
- Loop
```
# loop will end when use `break`

i = 5
loop do
    puts "Hello #{i}"
    i -= 1
    break if i <= 0
end

# Endless loop
loop {print "Keep going!"}
```

- .each
```
# use for chek all value in array or hashes

# Use {}
# object.each {|item| do something}

friends = ["Jake", "Ken", "Nelson"]
friends.each {|item| puts "#{item}"}

family = {"Homer"=>"dad", "Marge"=>"mom", "Lisa"=>"sister"}
family.each {|key, value| puts "#{key}: #{value}"}

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
s.each { |inner_array| inner_array.each { |item_of_inner_array| puts item_of_inner_array} }

=begin
- Use Do.End

object.each do |item|
    do something
end
=end

my_array = [1, 2, 3]

my_array.each do |x|
    x += 10
    puts "#{x}"
end

family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
}
 
family.each do |a, b|
  puts "#{a}: #{b}"
end

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
s.each do |a|
    a.each do |item|
        puts "#{item}"
    end
end
```

- .times
```
# .times is like `for` 
5.times {puts "Hello"}
```

### Note

- Every things is object in Ruby

- comments
```
# single line comment

=begin
mutli line comment
mutli line comment
mutli line comment
=end
```
- output
```
`puts` display in a separated line
`print` display inline
```

- `false` and `nil` is only two (non-true) value in Ruby

- symbol (https://ithelp.ithome.com.tw/articles/10161202)
```
- symbol vs string
symbol is immutable but string is mutable

```