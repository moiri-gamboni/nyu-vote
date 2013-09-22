Template.electionsAdminModifyNewChoice.events
  "click .submitChoice": (e) ->
    e.preventDefault()
    name = $(".new.choice.name").val()
    description = $(".new.choice.description").val()
    image = $(".new.choice.image").val()
    Meteor.call("createChoice", name, description, this._id, image)