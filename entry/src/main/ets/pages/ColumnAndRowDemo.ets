
/**
 * @see https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-linear-0000001504125349-V3
 * column 容器内部子元素是按照垂直方向排列。 row 容器内部子元素是按照水平方向排列。
 */
@Entry
@Component
struct ColumnAndRoomDemo {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0,1,2,3,4,5,6,7,8,9,10]
  build() {

    Column({space: 5}) {
      Text("线性布局Demo")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Black)
        .margin(20)
      // Column 容器内排列方向间距 通过 space 控制
      Column({space: 10}) {
        Row().width('90%').height(50).backgroundColor("#58D68D")
        Row().width('90%').height(50).backgroundColor("#D2B48C")
        Row().width('90%').height(50).backgroundColor("#58D68D")
      }
      .alignItems(HorizontalAlign.Center)
      .width("100%")

      Row({space: 10}) {
        Column().width("25%").height(100).backgroundColor("#58D68D")
        Column().width("25%").height(100).backgroundColor("#D2B48C")
        Column().width("25%").height(100).backgroundColor("#58D68D")
      }.width("100%")
      //在布局容器内，可以通过 justifyContent 属性设置子元素在容器主轴上的排列方式
      .justifyContent(FlexAlign.Center)

      /**
       * 在线性布局下，Blank 填充空白处，来自行自适应拉伸的效果
       */
      Row(){
        Text("Bluetooth").fontSize(18).fontStyle(FontStyle.Italic)
        Blank()
        Toggle({type: ToggleType.Switch, isOn: false})
      }.backgroundColor("#D5DBDB")
      .borderRadius(15)
      .padding({left: 20})
      .width("90%")
      .margin({top: 20})

      /**
       * 使用layoutWeight 设置
       */
      Row(){
        Column().backgroundColor("#58D68D").layoutWeight(1).height("100%")
        Column().backgroundColor("#D2B48C").layoutWeight(2).height("100%")
        Column().backgroundColor("#58D68D").layoutWeight(3).height("100%")
      }.height(50)

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item, index) => {
            Text(item.toString() + "-" + index.toString()).width("90%").height(100).backgroundColor("#F2F4F4").borderColor(15)
              .fontStyle(16).textAlign(TextAlign.Center).margin({top:10})
          })
        }.width("100%")
        .height(200)
        .margin({bottom: 10})
      }.backgroundColor("#AEB6BF")
      .scrollable(ScrollDirection.Vertical)
      .padding({bottom: 10})
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.Spring)
    }
  }
}