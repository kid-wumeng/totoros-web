<template lang="jade">
  detail-area.base(title="基本档案")
    .wrap
      detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
      detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
      detail-field(label="发行日期" v-if="publishDate") {{ displayPublishDate }}
      detail-field(label="风格" v-if="styles.length") {{ displayStyles }}
      detail-field(label="游戏模式" v-if="gameModes.length") {{ displayGameModes }}
      detail-field(label="游戏平台" v-if="gamePlatforms.length") {{ displayGamePlatforms }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/wiki/detail-area')
      'detail-field': require('components/wiki/detail-field')

    props:
      'subject':
        type: Object
        required: true

    computed:
      nameOrigin:    -> @subject.nameOrigin
      nameAliases:   -> @subject.nameAliases ? []
      publishDate:   -> @subject.publishDate
      styles:        -> @subject.styles ? []
      gameModes:     -> @subject.gameModes ? []
      gamePlatforms: -> @subject.gamePlatforms ? []

      displayNameAliases:   -> @nameAliases.join('、')
      displayPublishDate:   -> @model.date.displayGroup(@publishDate)
      displayStyles:        -> @styles.map((style) => @model.subject.displayStyle(style)).join('、')
      displayGameModes:     -> @gameModes.map((mode) => @model.subject.displayGameMode(mode)).join('、')
      displayGamePlatforms: -> @gamePlatforms.map((platform) => @model.subject.displayGamePlatform(platform)).join('、')
</script>


<style lang="less" scoped>
  .base{
  }
</style>
