@Entry
@Component
struct TabsDemo {
  @State currentIndex: number = 0

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg: normalImg).size({width: 25, height: 25})
      Text(title).fontColor(this.currentIndex === targetIndex ? "#FAE5D3": Color.Black)
    }.height(60)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    //barPosition 设置 tab Bar 的显示位置
    Tabs({barPosition: BarPosition.End}) {
      TabContent() {
        Column() {
          Tabs() {
            TabContent().tabBar("关注")
            TabContent().tabBar("视频")
            TabContent().tabBar("游戏")
            TabContent().tabBar("数码")
            TabContent().tabBar("体育")
            TabContent().tabBar("影视")
            TabContent().tabBar("人文")
            TabContent().tabBar("自然")
            TabContent().tabBar("军事")
            TabContent().tabBar("艺术")
          }
          //barMode 设置导航栏为滚动，默认的情况下是 Fixed表示为固定
          .barMode(BarMode.Scrollable)
        }.backgroundColor("#FAE5D3")
        .width('100%')
      }.tabBar(this.TabBuilder("首页", 0, $r('app.media.home_select'), $r('app.media.home_normal')))
      TabContent() {
        Text('推荐内容').fontSize(30)
      }.tabBar(this.TabBuilder("推荐", 1, $r('app.media.recmmend_select'), $r('app.media.recomend_normal')))
      TabContent() {
        Text('发现内容').fontSize(30)
      }.tabBar(this.TabBuilder("发现", 2, $r('app.media.discover_select'), $r('app.media.discover_normal')))
      TabContent() {
        Text('我的内容').fontSize(30)
      }.tabBar(this.TabBuilder("我的", 3, $r('app.media.me_selected'), $r('app.media.me_normal')))
    }.onChange((index => {
       this.currentIndex = index
    }))
  }
}