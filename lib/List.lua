type Predicate<T> = (T) -> boolean
type Iterator<T> = () -> (number, T)

type List<T> = {
	size: (self: List<T>) -> number;
	isEmpty: (self: List<T>) -> boolean;

	at: (self: List<T>, index: number) -> T;
	push: (self: List<T>, ...T) -> ();
	pop: (self: List<T>) -> T;
	remove: (self: List<T>, index: number) -> ();

	iter: (self: List<T>) -> (Iterator<T>, {T}, number);

	where: (self: List<T>, predicate: Predicate<T>) -> List<T>;

	print: (self: List<T>) -> ();
}

local function List<T>(initial: {T}): List<T>
	-- Narrowing down the name for my sanity's sake
	local _array = initial

	local self = {}

	function self.size()
		return #_array   
	end

	function self.isEmpty()
		return #_array < 1
	end

    -- The type checker can't infer the types correctly,
    -- hence why we are passing self explicitly
	function self.at(self: List<T>, index: number)
		local value = _array[index]
		assert(value ~= nil, "Index out of bounds")

		return value
	end

	function self.push(self: List<T>, ...: T)
		local first, second = ...

		-- Knowing there is only one item in the vararg
		-- lets us just insert it right away, which is faster
		if second == nil then
			table.insert(_array, first)
		else
			local pack = {...}
			table.move(pack, 1, #pack, #_array + 1, _array)
		end
	end

	function self.pop(): T
		local last = _array[#_array]
		assert(last ~= nil, "Popped from empty list")

		table.remove(_array, #_array)
		return last
	end

	function self.remove(self: List<T>, index: number)
		table.remove(_array, index)
	end

	function self.iter()
        local iterator, array, n = ipairs(_array)
        return iterator :: Iterator<T>, array :: {T}, n
	end

	function self.where(self: List<T>, predicate: Predicate<T>)
		local data: {T} = {}
		for _, v in ipairs(_array) do
			if predicate(v) then
				table.insert(data, v)
			end
		end

		return List(data)
	end

	function self.print()
		print(_array)
	end

	return self
end

return List