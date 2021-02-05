--lua tutorial I wrote to better unstand how things were working


--1: functions
function someFunction(parameter, anotherParameter)
    -- 
end

--2: variables
myfirstint = 0
myfirststring = "yes"
myfirsttable = {"text1","text2","text3"}
myfirstbool = false

mycopiedbool = myfirstbool
myfirstswitch = myfirststring or "no" --a switch means that if my first string is 0 or nil, the second variable will be token
myfirstint = nil --effectivly resets
--in lua we can assing a string to an integer holding variable, it just makes it a string holding variable instead

a, b, c, d = "a", "b", "else" --sets multiple variables at once, d not being assigned will become nil
local bool = false

--3: loops
maximum = 10
step = 1
for the_number = 1, maximium, step do
     print("the number is now: ", the_number)
end
--this will print out the number is now 1, the number is now 2, till 10 (including)

for the_number = 1, 5, 1 do
    print("The Number is now ",the_number)
end --this will give 1 to 5

for the_number = 1, 10, 2 do
    print("The Number is now ",the_number)
end --this will give 1, 3, 5, 7, 9 as the increaser is now 2

for the_number = 1, 5 do
    print("The Number is now ",the_number)
end --we can leave away the increment, it will be automaticly set to 1

--4: conditional statements
its_2010 = true
if its_2010 then
    print("It's 2010 now")
end

function SayHiTo(name)
    if name then --if the name is declared it will get printed
        print("Hello",name)
    end
end

function I_want_to_find(the_number)
    for a_number = 1, 100 do --assigning an array
        if the_number == a_number then
            print ("I found him!")
        else
            print ("Sorry, he's not here.")
        end
    end
end
--this fucntion will check if a number is betwoon 0 and 101

(3 ~= 4) --means 3 is not equal to 4

--4: operators
-- lua uses +, -, *, /, and ^ operators, but only on numbers 
mysecondstring = "I".."am".."Sam" --instead of the + we using double dots to connect strings
mystringlength = #mysecondstring --unique length function in lua

