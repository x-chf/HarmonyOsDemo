import { Action } from '@ohos.multimodalInput.keyEvent'
@Entry
@Component
struct CustomDialogDemo {
  selectDate: Date = new Date('2023-12-5')
  private select: number = 0
  private fruits: string[] = ['apple','orange2','peach3', 'grape4', 'banana5']
  onCancel() {
    console.info("Callback when click cancel")
  }

  onConfirm() {
    console.info("Callback when click confirm")
  }

  dialogController = new CustomDialogController({
    builder: CustomDialogEx({
      cancel: this.onCancel,
      confirm: this.onCancel
    }), alignment: DialogAlignment.Default
  })

  build() {
    Column({ space: 10 }) {
      Button('自定义弹窗')
        .onClick(() => {
          this.dialogController.open()
        })
        .borderRadius(8)
        .width('80%')
        .height(50)
        .margin({ top: 10 })
      //警告弹窗
      Button('警告弹窗')
        .onClick(() => {
          AlertDialog.show({
            title: "警告弹窗",
            message: "显示警告内容",
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -20 },
            gridCount: 5, //弹窗容器占栅栏格
            confirm: {
              value: 'confirm',
              action: () => {
                console.info("AlertDialog click confirm")
              }
            },
            cancel: () => {
              console.info("AlertDialog click cancel")
            }
          })
        })
        .borderRadius(8)
        .width('80%')
        .height(50)
        .margin({ top: 10 })

      Button('双按钮警告弹窗')
        .onClick(() => {
          AlertDialog.show({
            title: "警告弹窗",
            message: "显示警告内容",
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -20 },
            gridCount: 5, //弹窗容器占栅栏格
            primaryButton: {
              value: 'cancel',
              action: () => {
                console.info("AlertDialog click confirm")
              }
            },
            secondaryButton: {
              value: 'confirm',
              action: () => {
                console.info("AlertDialog click cancel")
              }
            }
          })
        })
        .borderRadius(8)
        .width('80%')
        .height(50)
        .margin({ top: 10 })

      Button('列表选择器')
        .onClick(() => {
          ActionSheet.show({
            title: 'ActionSheet title',
            message: 'Sheet Message',
            confirm: {
              value: "Confirm Btn",
              action: ()=> {
                console.info('ActionSheet confirm btn click')
              }
            },
            cancel: () => {
              console.info('ActionSheet cancel')
            },
            alignment: DialogAlignment.Bottom,
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info("select apples")
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info("select bananas")
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info("select pears")
                }
              },
              {
                title: 'watermelon',
                action: () => {
                  console.info("select watermelon")
                }
              }
            ]
          })
        })
        .borderRadius(8)
        .width('80%')
        .height(50)
        .margin({ top: 10 })

      Button('日期滑动选择器弹窗')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectDate,
            onAccept: (value: DatePickerResult) => {
              this.selectDate.setFullYear(value.year, value.month, value.day)
              console.info("DatePickerDialog: onAccept() " + JSON.stringify(value))
            },
            onCancel: () => {
              console.info("DatePickerDialog: onCancel()")
            },
            onChange: (value: DatePickerResult) => {
              console.info("DatePickerDialog: onChange : " + JSON.stringify(value))
            }
          })
        })
        .borderRadius(8)
      .width("80%").height(50).margin({top: 10})

      Button('文本滑动选择器弹窗')
        .onClick(() => {
          TextPickerDialog.show({
            range: this.fruits,
            selected: this.select,
            onAccept: (value: TextPickerResult) => {
              this.select = value.index
              console.info("TextPicker select " + value.value)
            },
            onCancel: ()=> {
              console.info("TextPicker onCancel()")
            },
            onChange: (value: TextPickerResult) => {
              console.info("TextPicker onChange " + value.value)
            }
          })
        })
        .borderRadius(8)
        .width("80%").height(50).margin({top: 10})

    }.width('100%').height('100%')
  }
}

@CustomDialog
struct CustomDialogEx {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('内容Content').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel').onClick(() => {
          this.controller.close()
          this.cancel()
        }).backgroundColor("#E5E8E8").fontColor(Color.Black).borderRadius(8)

        Button('Confirm').onClick(() => {
          this.controller.close()
          this.confirm()
        }).backgroundColor("#E5E8E8").fontColor(Color.Black).borderRadius(8)
      }.margin({ bottom: 10 })
    }
  }
}