Template.electionsAdminModify.helpers
  groups: () ->
    return Groups.find()

Template.electionsAdminModify.events
  "click .submitElection": (e) ->
    e.preventDefault()
    groups = $(".election.groups").val()
    #Elections.update({_id: this._id},$set:{name: name,description: description},$addToSet:{groups:$each:groups})
    oldElection = Elections.findOne(this._id)
    questionIndex = -1
    choiceIndex = -1
    Session.set("modifyingElection", "0")
    values = $('.election-form').serializeArray()
    allowAbstain = $('')
    oldElection.groups = groups
    for field in values
      switch field.name
        when "name"
          oldElection.name = field.value 
        when "description"
          oldElection.description = field.value
        when "questionName"
          choiceIndex = -1
          questionIndex += 1
          oldElection.questions[questionIndex].name = field.value
          oldElection.questions[questionIndex].options.allowAbstain = false
          oldElection.questions[questionIndex].options.multi = false
        when "questionDescription"
          oldElection.questions[questionIndex].description = field.value
        when "questionAllowAbstain"
          oldElection.questions[questionIndex].options.allowAbstain = if field.value == "on" then true else false
        when "questionMulti"
          oldElection.questions[questionIndex].options.multi = if field.value == "on" then true else false
        when "choiceName"
          choiceIndex += 1
          oldElection.questions[questionIndex].choices[choiceIndex].name = field.value
        when "choiceDescription"
          oldElection.questions[questionIndex].choices[choiceIndex].description = field.value
        when "choiceImage"
          oldElection.questions[questionIndex].choices[choiceIndex].image = field.value
    Elections.update(
      {_id: this._id},
      $set:
        name: oldElection.name
        description: oldElection.description
        questions: oldElection.questions
    )