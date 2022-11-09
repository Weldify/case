local Types = require(script.Parent.Types)

export type List<T> = Types.List<T>
type Predicate<T> = (T) -> boolean
type Compare<T> = (T, T) -> boolean

local function create<T>(): List<T>
	return {}
end

local function fromValues<T>(...: T): List<T>
	return {...}
end

local function clone<T>(from: List<T>): List<T>
	return table.clone(from)
end

local function unpack<T>(self: List<T>): ...T
	return table.unpack(self)
end

local function push<T>(self: List<T>, value: T)
	table.insert(self, value)
end

local function insert<T>(self: List<T>, index: T, value: T)
	table.insert(self, index, value)
end

local function pop<T>(self: List<T>): T
	return table.remove(self, #self)
end

local function remove<T>(self: List<T>, index: number)
	table.remove(self, index)
end

local function freeze<T>(self: List<T>)
	table.freeze(self)
end

local function isFrozen<T>(self: List<T>): boolean
	return table.isfrozen(self)
end

local function isEmpty<T>(self: List<T>): boolean
	return #self == 0
end

local function sort<T>(self: List<T>, compare: Compare<T>?)
	table.sort(self, compare)
end

local function where<T>(self: List<T>, predicate: Predicate<T>): List<T>
	local result: List<T> = {}
	
	for _, v in ipairs(self) do
		if predicate(v) then
			table.insert(result, v)
		end
	end

	return result
end

local function every<T>(self: List<T>, predicate: Predicate<T>): boolean
	for _, v in ipairs(self) do
		if not predicate(v) then
			return false
		end
	end

	return true
end

local function clear<T>(self: List<T>)
	table.clear(self)
end

local List = {
	create = create;
	fromValues = fromValues;
	clone = clone;

	unpack = unpack;

	push = push;
	insert = insert;

	pop = pop;
	remove = remove;

	freeze = freeze;
	isFrozen = isFrozen;

	isEmpty = isEmpty;

	sort = sort;

	where = where;
	every = every;

	clear = clear;
}

return List