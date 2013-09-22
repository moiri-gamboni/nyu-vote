Template.electionsAdminQuestion.helpers
  allowAbstain: () ->
    console.log(this.options)
    if this.options.allowAbstain then return "Allow" else return "Forbid"
  multi: () ->
    console.log(this.options)
    if this.options.multi then return "Multiple" else return "Single"
  voteCountQuestion: () ->
    count = 0
    if this.choices?.length > 0
      for choice in this.choices
        count += choice.votes.length
    return count