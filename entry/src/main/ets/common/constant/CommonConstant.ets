import { DataItem } from '../../data/DataItem'
export class CommonConstants {
  static datas: DataItem[] = [];
  static initialize(): DataItem[] {
    this.datas.push(new DataItem("pages/ColumnAndRowDemo", "线性布局Demo"))
    this.datas.push(new DataItem("pages/StackDemo", "层叠布局Demo"))
    this.datas.push(new DataItem("pages/FlexDemo", "弹性布局Demo"))
    this.datas.push(new DataItem("pages/RelativeContainerDemo", "相对布局Demo"))
    this.datas.push(new DataItem("pages/GridRow", "栅格布局Demo"))
    this.datas.push(new DataItem("pages/MediaQueryDemo", "媒体查询Demo"))
    this.datas.push(new DataItem("pages/GridDemo", "创建网格Demo"))
    this.datas.push(new DataItem("pages/SwiperDemo", "创建轮播Demo"))
    this.datas.push(new DataItem("pages/ComponentsDemo", "简单组件Demo"))
    this.datas.push(new DataItem("pages/CustomDialogDemo", "自定义弹窗"))
    this.datas.push(new DataItem("pages/PopupDemo", "气泡提示"))
    this.datas.push(new DataItem("pages/TabsDemo", "TabsDemo"))
    return this.datas
  }
}
