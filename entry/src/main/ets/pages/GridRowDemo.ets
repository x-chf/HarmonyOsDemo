/**
 * 栅格布局是一种通用的辅助定位工具，对移动设备的界面设计有较好的借鉴作用。主要优势：
 * 1、提供可循的规律：栅格布局可以为布局提供规律性的结构，解决多尺寸多设备的动态布局问题。通过
 * 将页面划分为等宽的列数和行数，可以方便地对页面的元素进行定位和排版。
 * 2、统一的定位标注：栅格布局可以为系统提供一种统一的定位标注，保证不同的设备上各个模块的布局一致性。
 * 可以减少设计和开发的复杂度，提供工作效率
 * 3、灵活的间距调整方法：栅格布局可以提供一种灵活的间距调整方法，满足特殊场景布局的调整需求。通过调整
 * 列与列之间和行与行之间的间距，可以控制整个页面的排版效果。
 * 4、自动换行和自适应：栅格布局可以完成一对多布局的自动换行和自适应。当页面的元素数量超出一行或一列的
 * 容量时，会自动换行或换列，并且在不同的设备自适应排版，使得页面布局更加灵活和适应性强。
 */

@Entry
@Component
struct GridRowDemo {
  @State bgColors: Color[] = [Color.Red,
  Color.Orange,
  Color.Yellow,
  Color.Green,
  Color.Pink,
  Color.Grey,
  Color.Blue,
  Color.Brown];
  build() {
    Column() {
      Text("栅格布局Demo")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Black)
        .margin(20)
      GridRow({columns: 3}) {
        ForEach(this.bgColors, (item, index) => {
          GridCol() {
            Row() {
              Text(`${index}`)
            }.width("100%").height('50')
          }.backgroundColor(item)
        })
      }.width('100%')
    }
  }
}