Template.electionsAdminModifyNewQuestion.events
  "click .submitQuestion": (e) ->
    e.preventDefault()
    name = $(".new.question.name").val()
    description = $(".new.question.description").val()
    if $(".new.question.allowAbstain").attr('checked') == "checked"
      allowAbstain = true 
    else 
      allowAbstain = false
    if $(".new.question.multi").attr('checked') == "checked"
      multi = true 
    else 
      multi = false
    Meteor.call("createQuestion", name, description, this._id, {allowAbstain: allowAbstain, multi: multi})