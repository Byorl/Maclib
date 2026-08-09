local source = fs.read("src/maclib.lua", "bin")
assert(
	not string.find(source, 'checkmark:GetPropertyChangedSignal("AbsoluteSize")', 1, true),
	"global settings must not create delayed size listeners"
)
assert(string.find(source, "runWithElevatedIdentity", 1, true), "restricted-thread UI guard is missing")

print("MacLib restricted-thread regression tests passed")
