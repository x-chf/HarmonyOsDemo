/**
 * Flex 提供更加有效的方式对容器内的子元素进行排列、对齐和分配剩余的空间。
 * 在弹性布局中，容器的子元素可以按照任意的方向排列。通过设置参数 direction ，可以决定
 * 主轴方向，从而控制子元素的排列的方向
 */
@Entry
@Component
struct FlexDemo {
  build() {
    Column() {
      Text("弹性布局Demo")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Black)
        .margin(20)
      Flex({direction: FlexDirection.Row}) {
        Text('1').width("30%").height(50).backgroundColor("#82E0AA")
        Text('2').width("30%").height(50).backgroundColor("#3498DB")
        Text('3').width("30%").height(50).backgroundColor("#82E0AA")
      }
      .width("90%")
      .height(70)
      .padding(10)
      .backgroundColor("#566573")
      //FlexDirection.RowReverse: 主轴为水平的方向，子组件从主轴反方向排布
      Flex({direction: FlexDirection.RowReverse}) {
        Text('1').width("30%").height(50).backgroundColor("#82E0AA")
        Text('2').width("30%").height(50).backgroundColor("#3498DB")
        Text('3').width("30%").height(50).backgroundColor("#82E0AA")
      }
      .width("90%")
      .height(70)
      .padding(10)
      .backgroundColor("#566573")
      .margin(10)

      Flex({direction: FlexDirection.Column}) {
        Text('1').width("30%").height(30).backgroundColor("#82E0AA")
        Text('2').width("30%").height(30).backgroundColor("#3498DB")
        Text('3').width("30%").height(30).backgroundColor("#82E0AA")
      }
      .width("90%")
      .height(50)
      .padding(10)
      .backgroundColor("#566573")

      Flex({direction: FlexDirection.Row, wrap: FlexWrap.Wrap}) {
        Text('1').width("50%").height(20).backgroundColor("#82E0AA")
        Text('2').width("50%").height(20).backgroundColor("#3498DB")
        Text('3').width("50%").height(20).backgroundColor("#E59866")
      }
      .width("90%")
      .padding(10)
      .margin(10)
      .backgroundColor("#566573")
      //justifyContent 参数设置在主轴方向的对齐方式。
      Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceEvenly}) {
        Text('1').width("30%").height(50).backgroundColor("#82E0AA")
        Text('2').width("30%").height(50).backgroundColor("#3498DB")
        Text('3').width("30%").height(50).backgroundColor("#82E0AA")
      }
      .width("90%")
      .height(70)
      .padding(10)
      .backgroundColor("#566573")


      Flex({direction: FlexDirection.Row,
        justifyContent: FlexAlign.SpaceBetween,
        wrap: FlexWrap.Wrap,
        alignContent: FlexAlign.Start}) {
        Text('1').width("30%").height(50).backgroundColor("#82E0AA")
        Text('2').width("60%").height(50).backgroundColor("#3498DB")
        Text('3').width("40%").height(50).backgroundColor("#82E0AA")
        Text('4').width("30%").height(50).backgroundColor("#3498DB")
        Text('5').width("20%").height(50).backgroundColor("#82E0AA")
      }
      .width("90%")
      .margin(10)
      .backgroundColor("#566573")

      Flex(){
        Text('flexBasis("auto")').flexBasis('auto') //未设置width以及flexBasis位auto，内容自身宽松
          .height(50).backgroundColor("#F5DEB3")
        //设置了width 以及 flexBasis值为auto，使用width 的值. 如果flexBasis 设置了值，会优先选择flexBasis
        Text('flexBasis("auto")' + 'with("40%")').width("40%").flexBasis("auto").height(50).backgroundColor("#D2B48C")
      }.width("90%")

      //flexGrow 属性，设置父容器的剩余空间分配给此属性所在组件的比例。用于 瓜分 父组件的剩余空间
      Flex() {
        Text("flexGrow(2)").flexGrow(1).width(100).height(50).backgroundColor("#F5DEB3")
        Text("flexGrow(3)").flexGrow(9).width(100).height(50).backgroundColor("#D2B48C")
        Text('no flexGrow').width(100).height(50).backgroundColor("#F5DEB3")
      }.width("90%").margin({top:10})
    }
  }
}