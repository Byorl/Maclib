local source = fs.read("src/maclib.lua", "bin")
assert(
	not string.find(source, 'checkmark:GetPropertyChangedSignal("AbsoluteSize")', 1, true),
	"global settings must not create delayed size listeners"
)
assert(string.find(source, "runWithElevatedIdentity", 1, true), "restricted-thread UI guard is missing")
assert(
	string.find(source, "local function checkSize()\n\t\t\t\t\t\trunWithElevatedIdentity", 1, true),
	"input sizing is not protected on restricted callbacks"
)
assert(
	string.find(source, "function SubTabFunctions:Select()\n\t\t\t\t\t\trunWithElevatedIdentity", 1, true),
	"subtab selection is not protected on restricted callbacks"
)
assert(
	string.find(source, "Selected = table.clone(selectedOptions)", 1, true),
	"programmatic dropdown selection does not preserve deterministic readback"
)

print("MacLib restricted-thread regression tests passed")
