<template lang="jade">
  .markdown-area(v-html="html")
</template>


<script lang="coffee">
  marked = require('marked/lib/marked')
  renderer = new marked.Renderer()


  parseCard = (url, text) ->
    query = model.assets.parseUrl(url).query
    query = model.assets.parseQuery(query)
    data  = query
    data.name = text
    return data


  renderSubjectCard = (url, text) ->
    data   = parseCard(url, text)
    type   = model.subject.displayType(data.type)
    season = if data.season then "Season #{data.season}" else ''
    card   =
      path: "subjects/#{data.id}"
      face: "subjects/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: [type, season].filter((item) -> item)
    return renderCard(card)


  renderRoleCard = (url, text) ->
    data = parseCard(url, text)
    card =
      path: "roles/#{data.id}"
      face: "roles/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['角色']
    return renderCard(card)


  renderPersonCard = (url, text) ->
    data = parseCard(url, text)
    year = data.year ? ''
    card =
      path: "persons/#{data.id}"
      face: "persons/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['人物', year].filter((item) -> item)
    return renderCard(card)


  renderOrganizationCard = (url, text) ->
    data = parseCard(url, text)
    year = data.year ? ''
    card =
      path: "organizations/#{data.id}"
      face: "organizations/#{data.id}/face?v=#{data['face.version']}"
      name: data.name
      subs: ['团体', year].filter((item) -> item)
    return renderCard(card)


  renderCard = (card) ->
    faceUrl = "#{cdn}/#{card.face}"
    return "
      <div>
        <a class='card' href=\"/#{card.path}\" onclick=\"window.toPathByPreventDefault(event, '/#{card.path}')\">
          <span class='left'>
            <img class='face' src=\"#{faceUrl}\"/>
          </span>
          <span class='right'>
            <span class='name'>#{card.name}</span>
            <span class='subs'>#{card.subs.join(' / ')}</span>
          </span>
        </a>
      </div>
    "


  renderer.link = (url, title, text) ->
    if /(jpg)|(jpeg)|(png)|(gif)$/i.test(url)
      return renderer.image(url)

    switch
      when /^(subject)/.test(url)      then return renderSubjectCard(url, text)
      when /^(role)/.test(url)         then return renderRoleCard(url, text)
      when /^(person)/.test(url)       then return renderPersonCard(url, text)
      when /^(organization)/.test(url) then return renderOrganizationCard(url, text)

    text ?= url
    return "<a href='#{url}' target='_blank'>#{text}</a>"


  renderer.image = (url, title, text) ->
    if not /^(http|https)/i.test(url)
      hash = url
      url  = "#{cdn}/pictures/#{hash}"
    return "
      <div class='image'>
        <img src='#{url}'/>
        <div class='desc2' style=\"display: #{if text then 'block' else 'none'}\">#{text ? ''}</div>
      </div>
    "


  marked.setOptions({
    renderer: renderer
    gfm: true
    breaks: true
  })


  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'content':
        type: String
        default: ''

    computed:
      html: ->
        contents = @content.split('\n')
        htmls = contents.map (content) -> if(content) then marked(content) else '<p class="empty"></p>'
        html = htmls.join('')
        html = html.replace(/<\/div>(<br>)+/g, '</div>')
        return html
</script>


<style lang="less">
  .markdown-area{
    box-sizing: border-box;
    width: 100%;
    word-break: break-all;
    line-height: 24px;
    font-size: 14px;
    color: darken(#445669, 10%);

    *{
      font-size: inherit;
      color: inherit;
    }

    >*{
      line-height: inherit;
    }

    > p.empty{
      height: 16px;
    }

    h1{
      font-size: 20px;
      line-height: 30px;
    }
    h2{
      font-size: 17px;
      line-height: 26px;
    }

    br{
      margin-bottom: 0 !important;
      height: 0 !important;
      line-height: 0 !important;
    }

    p{
      line-height: inherit;
    }

    em{
      font-weight: bold;
      font-style: normal;
      color: black !important;
    }

    a:not(.card){
      display: inline;
      font-weight: 500;
      color: #3db8c1;
      &:hover{
        text-decoration: underline;
      }
    }

    .image{
      display: block;
      img{
        display: block;
        max-width: 100%;
      }
      .desc2{
        margin-top: 4px;
        text-align: center;
        font-size: 13px;
        font-weight: 500;
        color: #707C88;
      }
    }

    ul, ol{
      margin-left: 1.5em;
    }

    pre{
      width: 100%;
      word-break: break-all;
      white-space: pre-wrap;
    }

    blockquote{
      box-sizing: border-box;
      width: 80%;
      padding: 0 12px;
      line-height: 19px;
      font-size: 13px;
      color: #A2AEBA;
      border-left: 3px solid #ADD9CF;
      text-align: justify;
    }
  }
</style>