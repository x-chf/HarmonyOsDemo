import {requestPermission} from '../utils/PermissionUtil';
import {Permissions} from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';


const permissions: Array<Permissions> = ['ohos.permission.INTERNET']
@Entry
@Component
struct ImageDemo {
  context = getContext(this) as common.UIAbilityContext
  result = requestPermission(this.context, permissions).then((ResponseResult) => {
    //console.info("responseResult " + ResponseResult)
    hilog.info(0x0000, 'testTag', 'response ' + ResponseResult);
  })

  @State imageDatas: string[] = [];

  getAllImg() {

  }

  build() {
    Column({space:5}) {
      Text("1、简单显示如何使用Image加载 url").fontColor(Color.Black).fontSize(12).margin({top: 10})
      Image("https://cdn.discordapp.com/attachments/1008571051392909393/1182582245333155870/gtog____RENAULT_TAlisman_white_color_car_218ddca9-30ce-40ce-8821-62157b876b7f.png").height(100).width(100)

      Text("2、加载raw资源").fontColor(Color.Black).fontSize(12).margin({top: 10})
      Image($rawfile('chinese_dragon.png')).width(100).height(100)



    }.justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start).padding({left: 10})
  }
}