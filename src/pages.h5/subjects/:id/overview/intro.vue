<template lang="jade">
  text-area.intro(:text="subject.intro" indent, :limit="200" more)
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .intro{
    padding: 0 20px;
    line-height: 21px;
    font-size: 14px;
  }
</style>