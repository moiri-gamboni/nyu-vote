Template.electionsAdminModifyQuestion.helpers
  allowAbstain: () ->
    return if this.options.allowAbstain == true then "checked" else ""
  multi: () ->
    return if this.options.multi == true then "checked" else ""