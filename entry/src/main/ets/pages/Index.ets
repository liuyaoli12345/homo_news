import router from '@ohos.router';
import hilog from '@ohos.hilog';
import { SearchBar } from '../view/SearchBar'


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State arr: string[] = ["Taylor Swift将发布新专辑<1989>", "奥本海默日本上映预冷", "abp项目第二大维护者三年105万工资被没收", "国资霸气入场！一日内抛售20亿楼盘，彰显救市信心！","哈马斯发动突袭，以色列宣布进入战争状态"]
  @State coverArr: string[] = ["https://files.lsmcloud.top/blog10139a4b16b798b71a16315f764e6d98.png","https://files.lsmcloud.top/blogb59d36c7967eee9166d7f84d2dc57844.png","https://files.lsmcloud.top/blog74f7475de22c2795f6447e654cc1f27f.png","https://files.lsmcloud.top/blog236cb18649aef8526a31e84a5cd60558.png", "https://files.lsmcloud.top/blog1bd9e7e882ce5619636b9daf79353471.png"]

  build() {
    Row() {
      Column() {
        // Text(this.message)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        SearchBar()
        Stack({ alignContent: Alignment.TopStart }) {
          Column() {
            List({ space: 4, initialIndex: 0 }) {
              ForEach(this.arr, (item, index) => {
                ListItem() {
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('' + item)
                      .width('70%')
                      .height(80)
                      .fontSize(20)
                      .textAlign(TextAlign.Start)
                      .margin(5)
                    Image(this.coverArr[index])
                      .width('25%')
                      .height(70)
                      .borderRadius(10)
                      .alt($r('app.media.noInternet'))
                  }
                }.borderRadius(10)
                .backgroundColor('#F5F5F5')
                .flexShrink(1)
                .onClick(() => {
                  hilog.fatal(0x0000, 'Tag', '%{public}s', 'onClick被点击')
                  router.pushUrl({
                    url: 'pages/DetailPage',
                    params: {
                      title: item,
                      cover: this.coverArr[index],
                      index: index,
                    }
                  });
                })
              }, item => item)
            }.width('95%')
          }.width('100%')
          .height('90%')
        }
      }
      .width('100%')
    }.height('100%')
  }
}