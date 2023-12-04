
/**
 *
 */
@Entry
@Component
struct GridDemo {
  nums: number[] = [1,2,3,4,5,6,7,8,9]
  @State service: Array<string> = ["直播","分类","领劵","会员","积分","进口","充值","抽奖","收藏","更多"]
  colors: string[] = ["#E74C3C","#A3E4D7","#7DCEA0","#F1C40F","#21618C","#8E44AD","#AF7AC5","#273746", "#E67E22", "#E74C3C"]
  build() {
    Column() {
      Grid() {
        ForEach(this.nums, (item, index) => {
          GridItem(){
            Text(item.toString()).fontColor(Color.Black).fontSize(20).textAlign(TextAlign.Center)
          }
          .backgroundColor("#AED6F1")
        })
      }
      .rowsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr')
      .width(300)
      .height(300)
      .backgroundColor("#EAECEE")
      .columnsGap(5)
      .rowsGap(5)

      Grid(){
        ForEach(this.service, (item, index) => {
          GridItem() {
            Stack() {
              Circle().width('100%').height('100%').fill(this.colors[index])
              Text(item).fontSize(15).fontColor(Color.White)
            }
          }.width('25%')
        })
      }
      .rowsTemplate('1fr 1fr')
      .rowsGap(15)
      .columnsGap(10)
      .width('90%')
      .height(200)
      .margin({top:20,left: 20})
      .padding(20)
      .borderRadius(20)
      .backgroundColor("#AED6F1")

      Grid() {
        GridItem() {
          Text('会议').fontColor(Color.White).fontSize(18)
        }.width(75).height(75).backgroundColor("#ABB2B9").borderRadius(5)
        GridItem() {
          Text('签到').fontColor(Color.White).fontSize(18)
        }.width(75).height(75).backgroundColor("#ABB2B9").borderRadius(5)
        GridItem() {
          Text('投票').fontColor(Color.White).fontSize(18)
        }.width(75).height(75).backgroundColor("#ABB2B9").borderRadius(5)
        GridItem() {
          Text('打印').fontColor(Color.White).fontSize(18)
        }.width(75).height(75).backgroundColor("#ABB2B9").borderRadius(5)
      }.backgroundColor("#EAECEE")
      .rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 1fr')
      .width(200)
      .height(200)
      .margin(10)
    }
  }
}