local Types = require(script.Parent.Types)

export type Set<T> = Types.Set<T>
type List<T> = Types.List<T>

local function create<T>(): Set<T>
    return {}
end

local function from<T>(...: T): Set<T>
    local args: List<T> = {...}
    local set: Set<T>

    -- Knowing there's only one item lets us skip iterating over the args
    if #args == 1 then
        set = {[args[1]] = true}
    else
        set = {}
        for _, v in ipairs(args) do
            set[v] = true
        end
    end

    return set
end

local function clone<T>(from: Set<T>): Set<T>
    return table.clone(from)
end

local function items<T>(self: Set<T>): List<T>
    local items: List<T> = {}
    for k in pairs(self) do
        table.insert(items, k)
    end

    return items
end

local function add<T>(self: Set<T>, item: T)
    self[item] = true
end

local function delete<T>(self: Set<T>, item: T)
    self[item] = nil
end

local function has<T>(self: Set<T>, item: T): boolean
    return self[item] ~= nil
end

local function freeze<T>(self: Set<T>)
	table.freeze(self)
end

local function isFrozen<T>(self: Set<T>): boolean
	return table.isfrozen(self)
end

local function isEmpty<T>(self: Set<T>): boolean
	return next(self) == nil
end

local function clear<T>(self: Set<T>)
    table.clear(self)
end

local Set = {
    create = create;
    from = from;
    clone = clone;

    items = items;

    add = add;
    delete = delete;

    has = has;

    freeze = freeze;
	isFrozen = isFrozen;

	isEmpty = isEmpty;

    clear = clear;
}

return Set