//this is 2
1 + 1

//this throws an error, so io is strongly typed
// 1 + "one"

// 0 is true
true and 0

// a empty string is also true
true and ""

// nil is false
true and nil

Foo := Object clone
Foo desc := "a foo that bars"
Foo doSomething := method("this does seomthing!" println)

bar := Foo clone

//do something
bar doSomething

//get the slot of bar's prototype slots
bar proto println
