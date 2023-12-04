@Entry
@Component
struct StackDemo {
  build() {
    Column () {
      Text("层叠布局Demo")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Black)
        .margin(20)
      Stack() {
        Text("item3")
          .fontSize(15)
          .width(250).height(250)
          .backgroundColor("#BA4A00")
          .textAlign(TextAlign.Start)
          //控制在Z轴的高度，zIndex 越大则会覆盖在 zIndex 小的组件上方
          //.zIndex(3)
        Text("item2").fontSize(15).width(150).height(150).backgroundColor("#F9E79F")
        Text("item1").fontSize(15).width(80).height(50).backgroundColor("#ABEBC6")
      }.width(300)
      .height(300)
      .backgroundColor("#D6DBDF")
      //alignContent 参数控制容器内组件的对齐方式
      .alignContent(Alignment.Top)
    }
  }
}