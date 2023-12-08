import bundleManager from '@ohos.bundle.bundleManager';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import {ResponseResult } from '../data/ResponseResult'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';


export async function checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
  let atManager = abilityAccessCtrl.createAtManager()
  let grantStatus: abilityAccessCtrl.GrantStatus
  //获取应用程序的accessTokenID
  let tokenId: number;
  try {
    let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo
    tokenId = appInfo.accessTokenId
  } catch (err) {
    console.error(`getBundleInfoForSelf failed , code is ${err.code}, message is ${err.message}`)
  }
  //检验应用权限是否被授予权限
  try {
    grantStatus = await atManager.checkAccessToken(tokenId, permission)
  } catch (err) {
    console.error(`checkAccessToken failed , code is ${err.code}, message is ${err.message}`)
  }
  return grantStatus
}

export async function checkPermission(): Promise<void> {
  const permission: Array<Permissions> = ['ohos.permission.INTERNET']
  let grantStatus = await checkAccessToken(permission[0])
  if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
    //已经授权
  } else {
    //申请权限
  }
}

export async function requestPermission(context: Context, permission: Array<Permissions>): Promise<ResponseResult> {
  try {
    let atManager = abilityAccessCtrl.createAtManager()
    let data = await atManager.requestPermissionsFromUser(context, permission)
    let grantStatus: Array<number> = data.authResults
    let length: number = grantStatus.length
    for (let i = 0; i < length; i++) {
      if (grantStatus[i] != 0) {
        ResponseResult.Failed
      }

      return ResponseResult.Success
    }
  } catch (err) {
    return ResponseResult.Failed
  }
}

export function openPermissionsInSystemSetting(context: Context): void {
  let uiAbilityContext = context as common.UIAbilityContext
  let wantInfo: Want = {
    action: 'action.settings.app.info',
    parameters: {
      settingsParamBundleName: "com.example.myapplication"
    }
  }
  uiAbilityContext.startAbility(wantInfo).then(() => {
    //跳转到具体应用设置页面
  }).catch((err) => {
    //处理异常问题
  })
}