@Entry
@Component
struct PopupAndMenuDemo {
  @State handlePopup: boolean = false
  @State handlePopupSecond: boolean = false
  @State customPopup: boolean = false

  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.menu")

  @Builder popupBuilder() {
    Row({space: 2}) {
      Image($r("app.media.icon_loading")).width(24).height(24)
      Text('This is a custom popup').fontSize(10)
    }.width(200).height(50).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)
  }

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({content: "复制", labelInfo: "Ctrl + C"})
      MenuItem({content: "黏贴", labelInfo: "Ctrl + V"})
    }
  }
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({startIcon: $r("app.media.menu"), content: "菜单选项"})
      MenuItem({startIcon: $r("app.media.menu"), content: "菜单选项"}).enabled(false)

      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: $r("app.media.arrow_right"),
        builder: this.SubMenu.bind(this)
      })

      MenuItemGroup({header: "小标题"}) {
        MenuItem({content: "菜单选项"})
          .selectIcon(true)
          .selected(this.select)
          .onChange((select) => {
            console.info("menuItem select " + select)
          })
      }
    }
  }

  build() {
    Column({space: 10}) {
      /**
       * Popup属性需绑定组件，当bindPopup属性中参数show 为true 的时候会
       * 弹出气泡显示
       */
      Button('PopupOptions').onClick(() => {
        this.handlePopup = !this.handlePopup
      }).bindPopup(this.handlePopup, {
        message: "This is a popup with PopupOptions"
      }).width('100').height("50")

      Button('PopupOptionsSecond').onClick(() => {
        this.handlePopupSecond = !this.handlePopupSecond
      }).bindPopup(this.handlePopupSecond, {
        message: "This is a popup with btn",
        primaryButton: {
          value: "cancel",
          action: () => {
            console.info("popup cancel btn click")
            this.handlePopupSecond = !this.handlePopupSecond
          }
        },
        secondaryButton: {
          value: 'confirm',
          action: () => {
            console.info('popup confirm btn click')
            this.handlePopupSecond = !this.handlePopupSecond
          }
        }
      }).height('50')

      Button('CustomPopup').onClick(() => {
        this.customPopup = !this.customPopup
        console.info("customPop btn click")
      }).bindPopup(this.customPopup, {
        builder: this.popupBuilder, // 气泡内容
        placement: Placement.Bottom, // 气泡弹出的位置
        popupColor: Color.Pink // 气泡颜色
      }).height('50')

      Button('click for menu').bindMenu([
        {
          value: "menu1",
          action: ()=> {
            console.info("handle Menu1 select")
          }
        }
      ]).height('50')

      Button("click for custom menu").bindMenu(this.MyMenu())
    }.width('100%').padding(10)
  }
}
