UI = require("ui")
ajax = require("ajax")

token = "61f614d68c69fab8e6b48475298114e40546fc25"
device = "53ff6f066667574849262367"
endpoint = "https://api.spark.io"
states = []

for i in [0..7]
  states.push false

refreshMenu = ->
  items = []

  for i in [0..7]
    items.push
      title: "D" + i
      icon: if states[i] then "images/on.png" else "images/off.png"

  menu.items 0, items

menu = new UI.Menu(sections: [items: []])
menu.show()
refreshMenu()

menu.on "select", (e) ->
  state = not states[e.itemIndex]
  textState = if state then "HIGH" else "LOW"
  ajax
    url: endpoint + "/v1/devices/" + device + "/digitalwrite?access_token=" + token
    method: "post"
    type: "json"
    data:
      args: e.item.title + "=" + textState
  , (data) ->
    states[e.itemIndex] = state
    refreshMenu()
  , (error) ->
    console.log "Error", JSON.stringify(error)
