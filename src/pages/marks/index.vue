<template lang="jade">
  #marks(:style="style")
    c-head
    feed-waterfall(v-if="showFeedWaterfall")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-head':         require('./head')
      'feed-waterfall': require('./feed-waterfall')

    data: ->
      showFeedWaterfall: true

    metaInfo: ->
      title: '标记'

    computed:
      style: ->
        'minHeight': document.body.clientHeight - 64 + 'px'

    created: ->
      @listen('RESET_MARKS', @resetMarks)

    methods:
      resetMarks: ->
        @showFeedWaterfall = false
        setTimeout (=> @showFeedWaterfall = true), 0
</script>


<style lang="less" scoped>
  #marks{
    background-image: url(http://cdn.totoros.cc/assets/big-bg);
    overflow: hidden;
    width: 100%;
  }
</style>
