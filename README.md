# STILL IN DEVELOPMENT
### The library is currently in heavy development. This means that it's barely usable and probably contains bugs and edge cases. Use at your own discretion or wait until the first release!

# ktnr
`ktnr` is a collection of high level container implementations such as `List`, `Map` and `Set`.
## Why?
I got tired of writing convenience functions in each and every one of my projects. It just got repetitive.
I also find luau's raw container types ugly and unintuitive at times, especially dictionary types. `{[K]: V}` just looks alien to me, and especially to my (already cramped) fingers.
## Goals
+ Ease of use: All you should ever need is a cheat sheet
+ Simple implementation: The implementation must be simple and well-documented
+ Full typings: Containers must be fully typed with no compromises
+ Acceptable performance: The user shouldn't worry about performance

# Cheatsheets
## List
```lua
local List = require(ktnr.List)
type List<T> = List.Type<T> -- Optional depending on whether you need this

-- Create a new list from a raw array
local numbers = List {1, 2, 3, 4, 5, 6}

-- Pushes values to the end of the list
numbers:push(7)
numbers:push(8, 9)

-- Returns a list where all values pass the following check.
-- In our case, every number smaller than 4 is gone!
local smallNumbers = numbers:where(function(n) n >= 4 end)

-- Iterate over list
for i, v in smallNumbers:iter() do
    -- your precious code
end

-- Gets the length of this list
local listSize = smallNumbers:size()

while not smallNumbers:isEmpty() do
    -- Removes the last value from this list and return it
    local num = smallNumbers:pop()
end

-- Prints the list's array directly (mainly used for debugging)
smallNumbers:print()

-- Using the type we extracted earlier
local function generateToadNames(): List<string>
    return List { "Bogart", "Hopscotch", "Kermit" }
end
```