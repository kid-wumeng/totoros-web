module.exports =

  state:
    open: false

  mutations:
    SHOW_CREATE_SUBJECT_MODAL: (state) ->
      state.open = true

    HIDE_CREATE_SUBJECT_MODAL: (state) ->
      state.open = false