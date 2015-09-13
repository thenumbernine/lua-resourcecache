local class = require 'ext.class'
local table = require 'ext.table'
local ResourceCache = require 'resourcecache'

local TextureCache = class(ResourceCache)

function TextureCache:setVars(gl, GLTex2D, args)
	self.gl = gl
	self.GLTex2D = GLTex2D
	self.args = args
end

function TextureCache:loaduncached(filename, allowrepeat)
	local args = table(self.args)
	args.filename = filename
	local gl = self.gl
	
	if not allowrepeat then
		args.wrap = {
			s = self.gl.GL_CLAMP_TO_EDGE,
			t = self.gl.GL_CLAMP_TO_EDGE,
		}
	end

	local tex = self.GLTex2D(args)

	return tex
end

return TextureCache
