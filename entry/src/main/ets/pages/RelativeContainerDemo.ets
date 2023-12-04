
/**
 * RelativeContainer 采用相对布局的容器，支持容器内部的子元素
 * 设置相对位置关系。子元素支持以兄弟元素为锚点，或者以父容器为锚点。
 * 为了明确定义锚点，必须为RelativeContainer及其子元素设置ID。
 * 父元素ID默认为 "__container__",其余的子元素通过id属性设置，
 * 没有设置ID属性的子元素不会在RelativeContainer中显示。
 */

@Entry
@Component
struct RelativeContainerDemo {
  build() {
    Row() {
      RelativeContainer() {
        Row().width(100).height(100).backgroundColor("#FF3333")
          .alignRules({
            //以父容器为锚点，竖直方向顶部对齐
            top: {anchor: "__container__", align: VerticalAlign.Top},
            middle: {anchor: "__container__", align: HorizontalAlign.Center}
          }).id("row1")

        Image($r('app.media.app_icon')).height(100).width(100)
          .alignRules({
            top: {anchor: "row1", align: VerticalAlign.Bottom},
            middle: {anchor: "row1", align: HorizontalAlign.Center}
          }).id("row2")

        Row().width(100).height(100).backgroundColor("#FFCC00")
          .alignRules({
            //以父容器为锚点，竖直方向顶部对齐
            left: {anchor: "__container__", align: HorizontalAlign.Start},
            top: {anchor: "row2", align: VerticalAlign.Top}
          }).id("row3")

        Row().width(100).height(100).backgroundColor("#FFCC00")
          .alignRules({
            //以父容器为锚点，竖直方向顶部对齐
            left: {anchor: "row1", align: HorizontalAlign.End},
            top: {anchor: "row2", align: VerticalAlign.Top}
          }).id("row4")

        Row().width(100).height(100).backgroundColor("#FFCC00")
          .alignRules({
            //以父容器为锚点，竖直方向顶部对齐
            left: {anchor: "row2", align: HorizontalAlign.Start},
            top: {anchor: "row2", align: VerticalAlign.Bottom}
          }).id("row5")


      }.width(300).height(300).border({width: 2, color: "#6699FF"})
    }.height("100%").width("100%").justifyContent(FlexAlign.Center)
  }
}