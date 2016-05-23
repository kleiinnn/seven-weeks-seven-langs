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

// The ::= assignment also creates an setter
Foo desc ::= "a foo that bars"
Foo doSomething := method("this does something!" println)

bar := Foo clone

//do something
bar doSomething

// execute by name
bar getSlot("doSomething") call

// as we created desc with ::= we can use the setter to assign a value
bar setDesc("a bar that foos")

//get the slot of bar's prototype slots
bar proto println

