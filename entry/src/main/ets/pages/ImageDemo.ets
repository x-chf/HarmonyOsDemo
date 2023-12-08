import {requestPermission} from '../utils/PermissionUtil';
import {Permissions} from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import { ResponseResult } from '../data/ResponseResult';


const permissions: Array<Permissions> = ['ohos.permission.INTERNET']
@Entry
@Component
struct ImageDemo {
  context = getContext(this) as common.UIAbilityContext
  result = requestPermission(this.context, permissions).then((ResponseResult) => {
    //console.info("responseResult " + ResponseResult)
    hilog.info(0x0000, 'testTag', 'response ' + ResponseResult);
  })
  build() {
    Column() {
      Image("https://cdn.discordapp.com/attachments/1008571051392909393/1182582245333155870/gtog____RENAULT_TAlisman_white_color_car_218ddca9-30ce-40ce-8821-62157b876b7f.png").height(50).width(50)
    }
  }
}