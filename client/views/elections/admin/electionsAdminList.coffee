Template.electionsAdminList.helpers
  elections: () ->
    return Elections.find()
  groups: () ->
    return Groups.find({_id:{$in:this.groups}})
  notModifying: () ->
    return Session.get("modifyingElection") != this._id
  openCloseElection: () ->
    if this.status == "open" then return "Close" else return "Open"
  voteCountTotal: () ->
    return this.voters.length

Template.electionsAdminList.events
  "click .modifyElection": (e) ->
    e.preventDefault()
    Session.set("modifyingElection", this._id)
  "click .openCloseElection": (e) ->
    e.preventDefault()
    if this.status == "open"
      status = "closed"
    else
      status = "open"
    Elections.update(
      {_id:this._id}
      $set:
        status: status
    )
