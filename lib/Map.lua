local Types = require(script.Parent.Types)

export type Map<K, V> = Types.Map<K, V>
type List<T> = Types.List<T>
type Predicate<T> = (T) -> boolean

local function create<K, V>(): Map<K, V>
    return {}
end

local function fromDict<K, V>(dict: {[K]: V}): Map<K, V>
    return dict
end

local function clone<K, V>(from: Map<K, V>)
    return table.clone(from)
end

local function values<K, V>(self: Map<K, V>): List<V>
    local list: List<V> = {}

    for _, v in pairs(self) do
        table.insert(list, v)
    end

    return list
end

local function keys<K, V>(self: Map<K, V>): List<K>
    local list: List<K> = {}

    for k in pairs(self) do
        table.insert(list, k)
    end

    return list
end

local function freeze<K, V>(self: Map<K, V>)
	table.freeze(self)
end

local function isFrozen<K, V>(self: Map<K, V>): boolean
	return table.isfrozen(self)
end

local function isEmpty<K, V>(self: Map<K, V>): boolean
	return next(self) == nil
end

local function where<K, V>(self: Map<K, V>, predicate: Predicate<V>): Map<K, V>
	local result: Map<K, V> = {}

	for k, v in pairs(self) do
		if predicate(v) then
			result[k] = v
		end
	end

	return result
end

local function every<K, V>(self: Map<K, V>, predicate: Predicate<V>): boolean
	for k, v in pairs(self) do
		if not predicate(v) then
			return false
		end
	end

	return true
end

local function clear<K, V>(self: Map<K, V>)
	table.clear(self)
end

local Map = {
    create = create;
    fromDict = fromDict;
    clone = clone;

    values = values;
    keys = keys;

    freeze = freeze;
	isFrozen = isFrozen;

	isEmpty = isEmpty;

    where = where;
    every = every;

    clear = clear;
}

return Map