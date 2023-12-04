import {CommonConstants as constants} from '../common/constant/CommonConstant'
import { DataItem } from '../data/DataItem'
import router from '@ohos.router'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {

  datas = constants.initialize()
  build() {
    Column() {
      List({space: 5}) {
        ForEach(this.datas, (item: DataItem) => {
          ListItem() {
            Row() {
              Text(item.name)
                .fontSize(15)
                .fontColor(Color.Black)
                .height('80%')
                .textAlign(TextAlign.Center)
            }
            .onClick(() => {
               router.pushUrl({url: item.pageAddress}).then(() => {
                 hilog.info(0x0000, 'testTag', "jump into " + item.pageAddress);
               })
            })
            //.width('80%')
            .height(40)
            .justifyContent(FlexAlign.Center)
          }
          .alignSelf(ItemAlign.Center)
          .width("90%")
          .borderWidth(1)
          .borderColor('#D5D8DC')
          .backgroundColor("#EAEDED")
          .borderRadius(10)

        })
      }
      .width('100%')
      .height('100%')
      .alignListItem(ListItemAlign.Center)
      .align(Alignment.Center)
      .margin({
        top: 10,
        bottom: 10
      })

    }
  }
}