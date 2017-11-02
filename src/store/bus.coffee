Vue = require('vue').default
bus = new Vue()


module.exports =

  mutations:
    'bus/ADD_EVENT_LISTENER': (state, {event, callback}) ->
      bus.$on(event, callback)

    UPDATE_SUBJECT:      (state, subject)      -> bus.$emit('UPDATE_SUBJECT', subject)
    UPDATE_ROLE:         (state, role)         -> bus.$emit('UPDATE_ROLE', role)
    UPDATE_PERSON:       (state, person)       -> bus.$emit('UPDATE_PERSON', person)
    UPDATE_ORGANIZATION: (state, organization) -> bus.$emit('UPDATE_ORGANIZATION', organization)

    CREATE_CAST: (state, cast) -> bus.$emit('CREATE_CAST', cast)
    UPDATE_CAST: (state, cast) -> bus.$emit('UPDATE_CAST', cast)
    REMOVE_CAST: (state, cast) -> bus.$emit('REMOVE_CAST', cast)

    CREATE_STAFF: (state, staff) -> bus.$emit('CREATE_STAFF', staff)
    UPDATE_STAFF: (state, staff) -> bus.$emit('UPDATE_STAFF', staff)
    REMOVE_STAFF: (state, staff) -> bus.$emit('REMOVE_STAFF', staff)

    CREATE_EPISODE:  (state, episode)  -> bus.$emit('CREATE_EPISODE',  episode)
    CREATE_EPISODES: (state, episodes) -> bus.$emit('CREATE_EPISODES', episodes)
    UPDATE_EPISODE:  (state, episode)  -> bus.$emit('UPDATE_EPISODE',  episode)
    REMOVE_EPISODE:  (state, episode)  -> bus.$emit('REMOVE_EPISODE',  episode)

    CREATE_MARK: (state, mark) -> bus.$emit('CREATE_MARK', mark)
    UPDATE_MARK: (state, mark) -> bus.$emit('UPDATE_MARK', mark)