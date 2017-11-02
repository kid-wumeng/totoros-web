module.exports = [{

  # 时间线（首页）
  path: '/'
  meta:
    keepAlive: true
  component: -> System.import('pages/timeline')

},{

  # 注册
  path: '/register'
  component: -> System.import('pages/register')

},{

  # 登录
  path: '/login'
  component: -> System.import('pages/login')

},{

  # 个人设定
  path: '/setting'
  redirect: path: '/setting/base'
  component: -> System.import('pages/setting')
  children: [{
    path: 'base'
    meta: path: 'base'
    component: -> System.import('pages/setting/base')
  },{
    path: 'pass'
    meta: path: 'pass'
    component: -> System.import('pages/setting/pass')
  },{
    path: 'logout'
    meta: path: 'logout'
    component: -> System.import('pages/setting/logout')
  }]

},{

  # 用户
  path: '/users/:id'
  component: -> System.import('pages/users/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
    component: -> System.import('pages/users/:id/overview')
  },{
    path: 'timeline'
    meta:
      path: 'timeline'
      keepAlive: true
    component: -> System.import('pages/users/:id/timeline')
  },{
    path: 'blogs'
    meta:
      path: 'blogs'
      keepAlive: true
    component: -> System.import('pages/users/:id/blogs')
  },{
    path: 'paints'
    meta:
      path: 'paints'
      keepAlive: true
    component: -> System.import('pages/users/:id/paints')
  },{
    path: 'animes'
    meta:
      path: 'animes'
      keepAlive: true
    component: -> System.import('pages/users/:id/animes')
  },{
    path: 'comics'
    meta:
      path: 'comics'
      keepAlive: true
    component: -> System.import('pages/users/:id/comics')
  },{
    path: 'games'
    meta:
      path: 'games'
      keepAlive: true
    component: -> System.import('pages/users/:id/games')
  }]

},{

  # 讨论版/acg
  path: '/acg'
  component: -> System.import('pages/acg')

},{

  # 讨论版/animes
  path: '/animes'
  component: -> System.import('pages/animes')

},{

  # 讨论版/comics
  path: '/comics'
  component: -> System.import('pages/comics')

},{

  # 讨论版/paints
  path: '/paints'
  component: -> System.import('pages/paints')

},{

  # 帖子
  path: '/posts/:id'
  component: -> System.import('pages/posts/:id')

},{
  # 维基
  path: '/wiki'
  component: -> System.import('pages/wiki')

},{

  # 作品
  path: '/subjects/:id'
  component: -> System.import('pages/subjects/:id')
  children: [{
    path: ''
    meta:
      path: ''
      keepAlive: true
    component: -> System.import('pages/subjects/:id/overview')
  },{
    path: 'world'
    meta:
      path: 'world'
      keepAlive: true
    component: -> System.import('pages/subjects/:id/world')
  },{
    path: 'casts'
    meta:
      path: 'casts'
      keepAlive: true
    component: -> System.import('pages/subjects/:id/casts')
  },{
    path: 'staffs'
    meta:
      path: 'staffs'
      keepAlive: true
    component: -> System.import('pages/subjects/:id/staffs')
  },{
    path: 'episodes'
    meta:
      path: 'episodes'
      keepAlive: true
    component: -> System.import('pages/subjects/:id/episodes')
  }]

},{

  # 角色
  path: '/roles/:id'
  component: -> System.import('pages/roles/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/roles/:id/overview')
  }]

},{

  # 人物
  path: '/persons/:id'
  component: -> System.import('pages/persons/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/persons/:id/overview')
  }]

},{

  # 团体
  path: '/organizations/:id'
  component: -> System.import('pages/organizations/:id')
  children: [{
    path: ''
    meta: path: ''
    component: -> System.import('pages/organizations/:id/overview')
  }]

},{

  # 管理
  path: '/admin'
  redirect: path: '/admin/forums'
  component: -> System.import('pages/admin')
  children: [{
    path: 'forums'
    meta: path: 'forums'
    component: -> System.import('pages/admin/forums')
  },{
    path: 'feedbacks'
    meta: path: 'feedbacks'
    component: -> System.import('pages/admin/feedbacks')
  },{
    path: 'sync'
    meta: path: 'sync'
    component: -> System.import('pages/admin/sync')
  }]
}]