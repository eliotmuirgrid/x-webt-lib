function WEBTcallWorker(Data)
   local ThreadComponent = component.fields().ThreadComponent
   local CallData      = {}
   CallData.func       = "WEBrespond"
   CallData.payload    = Data
   -- component.call requires string data so serialize the table to json
   CallData = json.serialize{data=CallData}
   component.call{name=ThreadComponent, data=CallData, func="main", async=true}
end

function WEBTcallServer(Response, CallbackFunction)
   local ServerComponent = component.fields().Server
    -- component.call requires string data so serialize the response to json
   local CallData = json.serialize{data=Response}
   component.call{name=ServerComponent, data=CallData, func=CallbackFunction, async=true}
end