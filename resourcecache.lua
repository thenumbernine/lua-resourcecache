local class = require 'ext.class'

local ResourceCache = class()

function ResourceCache:init()
	self.res = {}
end

function ResourceCache:loaduncached(filename)
	error("ResourceCache:loaduncached not implemented")
end

function ResourceCache:load(filename, ...)
	local obj = self.res[filename]
	if not obj then
		obj = self:loaduncached(filename, ...)
		self.res[filename] = obj
	end
	return obj
end

return ResourceCache
