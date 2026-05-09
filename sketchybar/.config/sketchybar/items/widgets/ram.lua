local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local ram = sbar.add("graph", "widgets.ram", 42, {
	position = "right",
	graph = { color = colors.red },
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = { string = icons.ram },
	label = {
		string = "ram ??%",
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		align = "right",
		padding_right = 0,
		width = 0,
		y_offset = 4,
	},
	padding_right = settings.paddings + 6,
})

ram:subscribe("cpu_update", function(env)
	sbar.exec(
		"memory_pressure -Q | awk -F': ' '/System-wide memory free percentage/ {gsub(/%/,\"\",$2); print $2}'",
		function(result)
			local usage = 100 - tonumber(result)

			ram:push({ usage / 100. })

			local color = colors.blue
			if usage > 30 then
				if usage < 60 then
					color = colors.yellow
				elseif usage < 80 then
					color = colors.orange
				else
					color = colors.red
				end
			end

			ram:set({
				graph = { color = color },
				label = "ram " .. usage .. "%",
			})
		end
	)
end)

ram:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the ram item
sbar.add("bracket", "widgets.ram.bracket", { ram.name }, {
	background = { color = colors.bg1 },
})

-- Background around the ram item
sbar.add("item", "widgets.ram.padding", {
	position = "right",
	width = settings.group_paddings,
})
