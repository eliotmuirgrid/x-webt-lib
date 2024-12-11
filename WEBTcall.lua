function WEBTcallWorker(Data, WorkerComponent)
   local CallData      = {}
   CallData.func       = "WEBrespond"
   CallData.payload    = Data
   -- component.call requires string data so serialize the table to json
   CallData = json.serialize{data=CallData}
   component.call{name=WorkerComponent, data=CallData, func="main", async=true}
end

function WEBTcallServer(Response, ServerComponent, CallbackFunction)
    -- component.call requires string data so serialize the response to json
   local CallData = json.serialize{data=Response}
   component.call{name=ServerComponent, data=CallData, func=CallbackFunction, async=true}
end