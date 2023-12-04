import mediaquery from '@ohos.mediaquery';
import window from '@ohos.window'
import common from '@ohos.app.ability.common';
/**
 * 媒体查询常用于以下两种场景：
 * 1、针对设备和应用的属性信息（比如显示区域、深浅色、分辨率），
 * 2、当屏幕发生动态改变时，比如分屏、横竖屏切换，同步更新应用的页面布局。
 */

let portraitFunc = null

@Entry
@Component
struct MediaQueryDemo {
  @State color: string = "#DB7093"
  @State text: string = "Portrait"
  //当设备横屏时成立
  listener = mediaquery.matchMediaSync("(orientation:landscape)")

  onPortrait(mediaQueryResult) {
    if (mediaQueryResult.matches) {
      this.color = "#FFD700"
      this.text = "Landscape";
    } else {
      this.color = "#DB7093"
      this.text = "Portrait"
    }
  }
  /**
   * 该函数在创建自定义组件的新实例后，在执行build函数之前执行。允许在aboutToAppear函数中
   * 改变状态变量，更改将在后续执行的build 函数中生效
   */
  aboutToAppear() {
    portraitFunc = this.onPortrait.bind(this);
    this.listener.on('change', portraitFunc)
  }

  //改变设备横竖屏状态函数
  private changeOrientation(isLandscape: boolean) {
    //获取UIAbility 实例的上下文信息
    let context = getContext(this) as common.UIAbilityContext
    window.getLastWindow(context).then((lastWidnow) => {
      lastWidnow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    })
  }

  build() {
    Column() {
      Text(this.text).fontSize(50).fontColor(this.color)

      Text('Landscape').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
        .onClick(() => {
          this.changeOrientation(true)
        }).margin({top: 10})
      Text('Portrait').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
        .onClick(() => {
          this.changeOrientation(false)
        }).margin({top: 10})
    }.width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}