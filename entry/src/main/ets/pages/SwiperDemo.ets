/**
 * Swiper 如果在自身尺寸属性未被设置时，会自动根据子组件的大小设置自身的尺寸。
 * 如果设置了固定尺寸，则在轮播的显示的过程中均以该尺寸生效。
 */
@Entry
@Component
struct SwiperDemo{
  private swiperController: SwiperController = new SwiperController()
  build() {
    Column() {
      Swiper(this.swiperController) {
        Text('0').width('90%').height('100%').backgroundColor(Color.Grey).textAlign(TextAlign.Center).fontSize(30)
        Text('0').width('90%').height('100%').backgroundColor(Color.Green).textAlign(TextAlign.Center).fontSize(30)
        Text('0').width('90%').height('100%').backgroundColor(Color.Orange).textAlign(TextAlign.Center).fontSize(30)
      }.width(300).height(200).margin(10).borderRadius(5)
      //loop 属性控制是否循环播放
      .loop(true)
      //auto 控制是否自动轮播子组件
      .autoPlay(true)
      //interval 设置轮播时间间隔,
      .interval(5000)
      //indicatorStyle 属性自动以导航栏位置和样式
      .indicatorStyle({
        size: 50, left: 100, color: Color.Blue
      })
      //是否显示轮播导航栏
      .indicator(true)

      Row({space: 10}) {
        Button("showNext").width(100).height(50)
          .onClick(() => {
            this.swiperController.showNext()
          })
        Button("showPrevious").width(100).height(50)
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }.width('80%')
      .height(200)


    }.width('100%')
    .justifyContent(FlexAlign.Center)
  }
}