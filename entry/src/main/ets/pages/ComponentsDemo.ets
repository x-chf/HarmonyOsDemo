@Entry
@Component
struct ComponentsDemo {
  scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Column({ space: 10 }) {
        //Button 组件使用
        ButtonComponent()
        //Radio 组件使用
        RadioComponent()
        //Toggle 组件使用
        ToggleComponent()
        //Progress 组件使用
        ProgressComponent()
        //TextInput 组件使用
        TextInputComponent()
      }
    }
    .scrollable(ScrollDirection.Vertical) //滚动方向
    .scrollBar(BarState.On) //滚动条常驻显示
    .scrollBarWidth(10) //滚动条宽度
    .edgeEffect(EdgeEffect.Spring) //滚动到边缘后回弹
    .padding(10)
  }
}
/**
 * Button 控件使用方法
 */
@Component
struct ButtonComponent {
  build() {
    Column({space: 10}) {
      Text('Button 示例').fontColor(Color.White).fontSize(15)
      Button('OK', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(9)
        .backgroundColor("#76D7C4")
        .width(90)
        .height(50)

      Button({ type: ButtonType.Normal, stateEffect: false }) {
        Row() {
          Image($r('app.media.icon_loading')).width(20).height(20)
          Text('loading').fontSize(12).fontColor(Color.White).margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }.borderRadius(8).backgroundColor("#76D7C4").width(100).height(50)
      //Button  type 类型 Circle(圆形)、Capsule(胶囊类型)
      Button('Circle', { type: ButtonType.Circle, stateEffect: false }).width(80).height(80)

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
        Text('Normal button').fontSize(12).fontColor(Color.White).margin(10)
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Button('OK', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x312aff)
            .width(90)
            .onClick(() => {
              console.log("Button Type .Normal")
            })
          Button({ type: ButtonType.Normal, stateEffect: true }) {
            Row() {
              LoadingProgress().width(20).height(20).margin({ left: 20 }).color(Color.White)
              Text('loading').fontSize(12).fontColor(Color.White).margin({ left: 5, right: 12 })
            }.alignItems(VerticalAlign.Center)
          }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)

          Button('Disable', { type: ButtonType.Capsule, stateEffect: false })
            .opacity(0.4)
            .backgroundColor(0x317aaf)
            .width(90)
        }

        Text('Capsule button').fontSize(12).fontColor(Color.White)
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Button('OK', { type: ButtonType.Capsule, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x312aff)
            .width(90)
            .onClick(() => {
              console.log("Button Type .Normal")
            })
          Button({ type: ButtonType.Capsule, stateEffect: true }) {
            Row() {
              LoadingProgress().width(20).height(20).margin({ left: 20 }).color(Color.White)
              Text('loading').fontSize(12).fontColor(Color.White).margin({ left: 5, right: 12 })
            }.alignItems(VerticalAlign.Center)
          }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)

          Button('Disable', { type: ButtonType.Capsule, stateEffect: false })
            .opacity(0.4)
            .backgroundColor(0x317aaf)
            .width(90)
        }

        Text('Circle button').fontSize(12).fontColor(Color.White)
        Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress().width(20).height(20).color(Color.White)
          }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)
        }

      }.width('100%').height(300).backgroundColor("#D5D8DC").borderRadius(8).padding(5)
    }.backgroundColor("#ABB2B9").width('95%').padding(10).borderRadius(10)
  }
}

@Component
struct RadioComponent {
  build() {
    Column({space:10}) {
      Text('Radio 示例').fontSize(15).fontColor(Color.White)
      Row() {
        Column() {
          Text('Radio1').fontColor(Color.White).fontSize(10)
          Radio({value: "Radio1", group: 'radioGroup'}).checked(true)
            .height(50).width(50)
            .onChange((isCheck: boolean) => {
                console.log("Radio1 status is " + isCheck)
             })
        }

      }
    }.borderRadius(8).backgroundColor("#ABB2B9").width('95%').padding(10).margin({top:5})
  }
}

@Component
struct ToggleComponent {
  build() {
    Column({space: 10}) {
      Text('Toggle 示例').fontSize(15).fontColor(Color.White)
      Flex({justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Start}) {
        Toggle({type: ToggleType.Switch, isOn: false})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFF')
          .onChange((isOn: boolean) => {
            console.log("Component status : " + isOn)
          })
        Toggle({type: ToggleType.Switch, isOn: false})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFF')
          .onChange((isOn: boolean) => {
            console.log("Component status : " + isOn)
          })
      }

      Flex({justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Start}) {
        Toggle({type: ToggleType.Checkbox, isOn: false})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFF')
          .onChange((isOn: boolean) => {
            console.log("Component status : " + isOn)
          })
        Toggle({type: ToggleType.Checkbox, isOn: false})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFF')
          .onChange((isOn: boolean) => {
            console.log("Component status : " + isOn)
          })
      }

      Row() {
        //当Toggle type 为 Button 时候，只能包含一个子组件
        Toggle({type: ToggleType.Button, isOn: true}) {
          Text('Status Button').fontColor('#182431').fontSize(12)
        }.width(100).selectedColor(Color.Pink)

        Toggle({type: ToggleType.Checkbox, isOn: true}).selectedColor(Color.Pink)
        Toggle({type: ToggleType.Switch, isOn: true}).selectedColor(Color.Pink)
      }
    }.borderRadius(8).backgroundColor("#ABB2B9").width('95%').padding(10).margin({top:5})
  }
}

@Component
struct ProgressComponent {
  build() {
    Column() {
      Text('Progress 示例').fontSize(15).fontColor(Color.White)

      Column() {
        Text('Linear Progress ').fontColor(Color.White).fontSize(10)
        Progress({value: 30, total: 100, type: ProgressType.Linear}).width(200).margin({top: 5})
        Progress({value: 20, total: 100, type: ProgressType.Linear}).color(Color.Grey).value(50).width(200).margin({top: 5})
      }.alignItems(HorizontalAlign.Start).width('100%')

      Column() {
        Text('Eclipse Progress ').fontColor(Color.White).fontSize(10)
        Row({space: 10}) {
          Progress({value: 30, total: 100, type: ProgressType.Eclipse}).width(50).margin({top: 5})
          Progress({value: 20, total: 100, type: ProgressType.Eclipse}).color(Color.Grey).value(50).width(50).margin({top: 5})
        }
      }.alignItems(HorizontalAlign.Start).width('100%').margin({top: 5})

      Column() {
        Text('ScaleRing Progress').fontSize(10).fontColor(Color.White)
        Row({space: 40}) {
          Progress({value: 10, type: ProgressType.ScaleRing}).width(100)
          Progress({value: 20, total: 150, type: ProgressType.ScaleRing})
            .color(Color.Grey).value(50).width(100)
            //strokeWidth 设置进度调宽度。 scaleCount 设置环形进度条总刻度数。 scaleWidth 设置环形进度条刻度粗细
            .style({strokeWidth: 20, scaleCount: 30, scaleWidth: 3})
        }.margin({top: 5})
      }.alignItems(HorizontalAlign.Start).width('100%').margin({top: 5})

      Column() {
        Text('Ring Progress').fontSize(10).fontColor(Color.White)
        Row({space: 40}) {
          Progress({value: 10, type: ProgressType.Ring}).width(100)
          Progress({value: 20, total: 150, type: ProgressType.Ring})
            .color(Color.Grey).width(100)
            .style({strokeWidth: 20, scaleCount: 30 , scaleWidth: 20})
        }.margin({top: 5})
      }.alignItems(HorizontalAlign.Start).width('100%').margin({top: 5})

      Column() {
        Text('Capsule Progress').fontSize(10).fontColor(Color.White)
        Row({space: 40}) {
          Progress({value: 10, type: ProgressType.Capsule}).width(100).height(50)
          Progress({value: 20, total: 150, type: ProgressType.Capsule})
            .color(Color.Grey).width(100).height(50)
        }.margin({top: 5})
      }.alignItems(HorizontalAlign.Start).width('100%').margin({top: 5})

    }.borderRadius(8).backgroundColor("#ABB2B9").width('95%').padding(10).margin({top:5})
  }
}

@Component
struct TextInputComponent {
  build() {
    Column() {
      Text("TextInput/TextArea 示例").fontColor(Color.White).fontSize(15)

      Column({space: 5}) {
        TextInput({placeholder: "input your name"}).margin({top:20})
          .onSubmit((enterKey: EnterKeyType) => {
            console.info("输入法回车键的类型值" + enterKey)
          })

        TextInput({placeholder: "input your password"}).type(InputType.Password)
          .margin({top: 10})
          .onSubmit((enterKeyType) => {
            console.info("输入法回车键类型值 " + enterKeyType)
          })

        Row(){
          Button('Sign in').width(150).height(40).margin({top: 20})
        }.width('100%').alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center)
      }.alignItems(HorizontalAlign.Start).margin({top: 5})
    }.borderRadius(8).backgroundColor("#ABB2B9").width('95%').padding(10).margin({top:5})
  }
}