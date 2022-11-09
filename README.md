# STILL IN DEVELOPMENT
### The library is currently in heavy development. This means that it's barely usable and probably contains bugs and edge cases. Use at your own discretion or wait until the first release!

# case
`case` is a collection of types and utility functions for containers such as `List`, `Map` and `Set`.
## Why?
I got tired of writing convenience functions in each and every one of my projects. It just got repetitive.
I also find luau's raw container types ugly and unintuitive at times, especially dictionary types. `{[K]: V}` just looks alien to me, and especially to my (already cramped) fingers.
## Goals
+ Convenience: Convenient while still being lightweight
+ Speed: Performance must match raw containers.
+ Simplicity: All you should ever need is a cheat-sheet
+ Strict typings: The typings must be complete and with no compromises
+ Obstruct `table` library: The user should never have to use the `table` library
# Cheatsheets
## List
```lua
local List = require(ktnr.List)
type List<T> = List.List<T>

List.fromArray {1, 2, 3, 4}
List.fromValues(1, 2, 3, 4)
List.clone(list) -- Clone from this list

List.unpack(list) -- Return all values as a vararg

List.push(list, value) -- Insert a value at the end of the list
List.insert(list, index, value) -- Insert a value at a specific index, shifting other values up if necessary

List.pop(list) -- Remove the last value and return it
List.remove(list, index) -- Removes the value at this index, shifting other values down if necessary

List.freeze() -- Makes the list immutable (shallow)
List.isFrozen()

List.isEmpty()

List.sort(list, function(v1, v2) -- Sorting function is optional
	return condition
end)

List.where(list, function(n) -- returns a new list where all values satisfy this condition
	return condition
end)

List.every(list, function(n) -- returns whether all values in this list satisfy this condition
	return condition
end)

List.clear(list) -- removes all values from the list
```
## Map
```lua
-- TBD
```
## Set
```lua
-- TBD
```
# Alternatives
### [Sift](https://github.com/csqrl/sift)
An *immutable* data library for Luaua and roblox-ts