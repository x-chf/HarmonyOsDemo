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
    return this.datas
  }
}
