# Byorl Maclib extensions

The original Maclib API remains available. Load this fork with:

```lua
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Byorl/Maclib/main/src/maclib.lua"))()
```

## Subtabs

Create a subtab group from any normal tab. Each subtab owns independent sections and scrolling state.

```lua
local tabGroup = Window:TabGroup()
local main = tabGroup:Tab({Name = "Main"})
local pages = main:SubTabGroup()

local farming = pages:SubTab({Name = "Farming", Columns = 2})
local settings = pages:SubTab({Name = "Settings", Columns = 1})

local farmingLeft = farming:Section({Side = "Left"})
local farmingRight = farming:Section({Side = "Right"})
local settingsSection = settings:Section({Side = "Left"})

farming:Select()
```

`Columns = 1` expands the left column across the page. `Columns = 2` is the default. `Tab:SubTab(settings)` is a convenience alias that creates or reuses the tab's subtab group.

Subtab methods:

- `SubTab:Select()`
- `SubTab:Section(settings)`
- `SubTab:UpdateName(name)`
- `SubTab:SetVisibility(visible)`
- `SubTabGroup:GetSelected()`

## Literal percentages

Use `DisplayMethod = "LiteralPercent"` when the slider values themselves are percentages. Entering `75%` then produces the numeric value `75` instead of mapping 75 percent through the configured minimum and maximum.

```lua
section:Slider({
	Name = "UI Size",
	Default = 75,
	Minimum = 35,
	Maximum = 120,
	DisplayMethod = "LiteralPercent",
	Precision = 0,
	Callback = function(value)
		print(value)
	end,
})
```

Sliders also accept `onInputBegan` and `onInputComplete`. Drag calculations use the track geometry captured when dragging starts, which prevents feedback when the callback resizes the UI containing the slider.

## Responsive controls

Slider and input labels use a dedicated upper row. The track or text box uses the lower row at full section width, avoiding overlap in compact sections and on mobile screens.

For the complete original element API, see the [upstream documentation](https://brady-xyz.gitbook.io/maclib-ui-library).
