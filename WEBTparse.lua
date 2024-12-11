 --[[ 
Data is a json string of the form: 
   Data["func"]      = function to callback
   Data["payload"]   = http request as string
]]

function WEBTparse(Data)
   if (not Data) or (#Data == 0) then return nil end
   local Parsed = json.parse{data=Data}
	local CallbackFunction = Parsed.func
   local Request = Parsed.payload
   return Request, CallbackFunction
end