<template lang="jade">
  .head
    forum-banner(:forum="forum")
    .tab-bar-wrap
      tab-bar(:forum="forum")
</template>


<script lang="coffee">
  module.exports =
    components:
      'forum-banner': require('components/image/forum-banner')
      'tab-bar':      require('./tab-bar')

    props:
      'forum':
        type: Object
        required: true
</script>


<style lang="less">
  .head{
    .tab-bar-wrap{
      margin-bottom: 20px;
      border-bottom: 1px solid lighten(#E4E8EB, 4%);
    }
  }
</style>