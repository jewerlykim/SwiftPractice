# SwiftPractice
## 1 . VStack, HStack
### Usage
```swift
VStack{
  code
}
```
Vertical View
```swift
HStack{
  code
}
```
Horizontal View

## 2 . State
### Usage
```swift
@State
private var isActivated : Bool = false

HStack{
  code
}.onTapGesture {
  withAnimation{ // Get animation effect
    self.isAcitivated.toggle() // toggle make true to false, false to true
  }
}
.edgesIgnoringSafeArea(.all) // ignoring safe area 
Spacer() // make empty area
```
### Navigation
```swift
NavigationView{
            code
               
                // navigation button(link)
                NavigationLink(destination: MyTextView()){
                    Text("navigation")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top, 50)            
        } // NavigationView
```

## 3 . Binding
@Binding은 부모 view의 @State와 같은 값을 양방향으로 연결되도록 해준다. 화면전환을 했을 때에도 부모에서의 State값을 잃지않고 가져갈 수 있게 해준다.
### Usage
```swift
// 자식 view에서는 
    // 데이터를 연동시킨다
    @Binding
    var isActivated : Bool
    
    // 생성자
    init(isActivated : Binding<Bool> =
            .constant(false)) {
        _isActivated = isActivated
    }
    
    var body : some View {
        VStack{
            // code
        } // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
```
```swift
// 부모 view에서는
@State
    private var isActivated : Bool = false
    
    MyVstackView(isActivated: $isActivated)
    
    // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView(isActivated: $isActivated)){
                    code
                }.padding(.top, 50)
```

## 4 . webview
UIViewRepresentable, UIkit SwiftUI 호환
### Usage
```swift
import WebKit

// UI Kit의 UIview를 사용할 수 있도록 한다.
struct MyWebview : UIViewRepresentable{
    var urlToLoad : String
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else{
            return WKWebView()
        }
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
    }
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
    }
}
```
- guard let 은 else문에 도달시 반드시 scope을 종료시킨다.
```swift
// In contentView
NavigationView{
            HStack{
                NavigationLink(
                    destination:
                        MyWebview(urlToLoad: "https://www.naver.com")
                        .edgesIgnoringSafeArea(.all)
                ){
                    Text("네이버")
                }
            }
```

## 5 . Text
### Properties
```swift
Text("Lorem Ipsum") // dummy text site
	.tracking(1) // 글자와 글자 사이의 간격
	.font(.system(.body, design: .monospaced)) 
	// size, type, fontdesign 등 여러가지가 있다.
	.fontWeight(.medium) // 굵게 하겠다
	.multilineTextAlignment(.center) // 글 정렬 기본 Leading
	.lineLimit(**nil**) // 멀티라인이 됨
	.lineSpacing(10) // 줄 사이 간격
	.truncationMode(.tail) 
	// 글자 잘리는 위치 정하기 head, tail, middle ...으로
	.shadow(color: Color.red, radius: 1.5, x: 0.0, y: 10)
	// 글자 그림자 효과
	.padding() 
	// 기본 패딩 10 vertical 위아래, horizontal 양 옆
	.background(Color.yellow) //배경색
	.cornerRadius(20) // padding 하고 순서 중요함
	.padding()
	.background(Color.green)
	.foregroundColor(Color.white) // 글자 색깔
```
### DateFormatter
```swift
static let dateFormat : DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "YYYY년 M월 d일" // 커스텀
	formatter.dateStyle = .full // Thursday, May 13, 2021
	formatter.dateStyle = .long // May 13, 2021
	return formatter
}()
```
```swift
var today = Date() // 오늘의 날짜 가져오는 메소드
```
```swift
Text("오늘의 날짜 입니다 : \(today, formatter: ContentView.dateFormat)") 
// 스위프트에서 문자열 출력하는 방법
```
### how print bool or int type
#### Bool
```swift
var trueOrFalse : Bool = false
```
```swift
Text("참 혹은 거짓 \(String(trueOrFalse))")
// String으로 타입 변환이 필요하다.
```
#### Int
```swift
var num : Int = 123
```
```swift
Text("숫자입니다. \(num)")
```


## 6 . Image
### Usage
```swift
Image("myImage") // Assets.xcassets에 넣으면 바로 사용 가능
```
```swift
Image(systemName : "flame.fill") // sf symbol 다운받으면 사용가능
```
### Properties
```swift
Image(systemName : "flame.fill")
	.font(.system(size : 200)) // 이미지 사이즈 조절
	.foregroundColor(.red) // 이미지 색
	.shadow(color : .gray, radius : 2, x : 5, y : 5) // 그림자
```
```swift
Image("myImage")
	.resizable() // 화면에 딱 맞게 이미지 조정
	.scaledToFit()
	.scaledToFill() // 꽉 채우기
	.aspectRatio(contentMode : .fill) // fit, fill
	.frame(width : 300, height : 300) // frame 사이즈 만큼 이미지 잘라줌
	.offset(y : -100) // offset 만큼 이동
	.clipShape(Circle()) // 동그랗게 자르기
	.overlay(Circle() // 그림 위에 덧붙이기 여기선 원모양으로
				.foregroundColor(.black)
				.opacity(0.4))// 투명도 0(투명) <= opacity <= 1(불투명)
	.overlay(Circle()
				.stroke(Color.red, lineWidth: 10) // 겉으로 자르기
				.padding())
	.cliped() // frame 주변 자르기
	.edgesIgnoringSafeArea(.all) // safe area 없애기
```

## 7 . VStack, HStack, ZStack
### VStack
#### Structure
![](https://images.velog.io/images/jewelrykim/post/ed21e151-159c-4955-9b9b-b812ef0a942e/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-14%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.13.28.png)
이런식으로 Vertical로 Stack이 쌓이게 된다.

```swift
VStack(alignment : .leading, spacing : 10) {
// alignment : 왼쪽 정렬, 가운데 정렬, 오른쪽 정렬
// spacing : 각 view 사이의 간격
}
```
### HStack
#### Structure
![](https://images.velog.io/images/jewelrykim/post/e3cdf827-c204-4365-b3f3-d6125fa169a0/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-14%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.16.50.png)
Horizontal로 View가 쌓인다.
```swift
HStack(alignment : .center){
}
```
### ZStack
#### Structure
![](https://images.velog.io/images/jewelrykim/post/20e27705-a6e9-473c-8c23-e231b20085f1/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-14%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.18.33.png)
3차원 형식으로 View가 겹겹이 쌓인다.
```swift
ZStack{ // 위에서부터 아래로 쌓임
Rectangle()
.frame(width: 200, height: 200, alignment:.center)
.foregroundColor(Color.red)
.zIndex(0)

Rectangle()
.frame(width: 100, height: 100, alignment:.center)
.foregroundColor(Color.yellow)
.zIndex(1.0)

Image(systemName: "flame.fill")
.font(.system(size: 30))
.foregroundColor(.white)
.zIndex(2)
}
```
zIndex가 낮을수록 가장 아래에 쌓인다. default 값은 0.
위 코드를 실행하면 아래 그림과 같다.
![](https://images.velog.io/images/jewelrykim/post/040cc0a9-87fb-402a-b7fe-04358fbdde4b/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-14%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.21.13.png)

## 8 . Layout 1
### ZStack 정렬
```swift
ZStack(alignment : .bottomTrailing){ // 오른쪽 아래 정렬
}
```
### ScrollView
```swift
ScrollView{
	VStack{
	}
}
```
## 9 . Costum View
![](https://images.velog.io/images/jewelrykim/post/4c14f547-667a-47e2-8429-c0a11b909007/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-15%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.02.54.png)
이런 식으로 같은 카드지만 내용을 다르게 하는 방법에 대해서 알아보자.
```swift
// MyCard.swift
struct MyCard : View {
// 멤버 변수 넣는 방법
var icon : String
var title : String
var start : String
var end : String
var bgColor : Color

var body : some View {
	HStack(spacing : 20) {
		Image(systemName: icon)
			.font(.system(size: 40))
			.foregroundColor(.white)
		VStack(alignment : .leading, spacing : 0) {
			Divider().opacity(0)
			Text(title)
				.font(.system(size: 25))
				.fontWeight(.bolde)
				.foregroundColor(.white)

		Spacer().frame(height : 5)

		Text("\(start) - \(end)")
			.foregroundColor(.white)

		}
	}// HStack
	.padding(30)
	.background(bgColor)
	.cornerRadius(20)
	}
}
```
```swift
// ContentView.swift
MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
```

## 10 . List View
```swift
// 1
List{
	Text("리스트")
	Text("리스트")
	Text("리스트")
	Text("리스트")
}
```
```swift
// 2
List{
	ForEach(1...10, id : \.self){
		Text("마이 리스트 \($0)")
	}
}
```
```swift
// 3
List{
	ForEach(1...10, id : \.self){ itemIndex in
		Text("마이 리스트 \(itemIndex)")
	}
}
```
```swift
// section
List{
	Section(header : Text("오늘 할 일")){
		ForEach(1...3 : \.self){itemIndex in
			MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", 				start: "1 PM", end: "3 PM", bgColor: Color.green)
			}
	}.listRoxInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)) // 섹션 안의 목록들 간격 조정
	.listRowBackground(Color.yellow) // 섹션에 백그라운드 칼라 넣기
}// List
```
```swift
// List Properties
List{
}.listStyle(GroupedListStyle()) // 뷰들이 묶임 PlainListStyle() 이 기본
.navigationBarTitle("네비게이션 바 제목")
.onAppear{ // 뷰가 보일때 무엇을 할 것인가
	self.isNavigationBarHidden = false
}
```
#### state, binding 복습
```swift
// ContentView
@State  var  isNavigationBarHidden : Bool = false
NavigationLink(destination : MyList(isNavigationBarHidden : self.$isNavigationBarHidden)){
}
```
```swift
// MyList
@Binding  var  isNavigationBarHidden : Bool
// 생성자에서 초기화
init(isNavigationBarHidden : Binding<Bool> = .constant(false)){
	// 구분선 없애주기 위한 작업
	if #available(iOS 14.0, *){
	}else{
		UITableView.appearance().tableFooterView = UIView()
	}
	UITableView.appearance().separatorStyle = .none

	_isNavigationBarHidden = isNavigationBarHidden // binding = 외부
}
```


## 11 . NavigationView
### Properties
#### displayMode .inline
```swift
NavigationView{
	.navigationBarTitle("안녕하세요", displayMode : .inline)
}
```
![](https://images.velog.io/images/jewelrykim/post/d41adabb-6f9d-49ff-a892-94285f42cf6e/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-16%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%209.09.43.png)
#### displayMode .large
```swift
NavigationView{
	.navigationBarTitle("안녕하세요", displayMode : .large)
}
```
![](https://images.velog.io/images/jewelrykim/post/22d5d099-89d4-4be7-abb7-dfb1ea0828e3/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-16%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%209.10.18.png)
#### navigationBarItems
```swift
.navigationBarItems(
	leading : Button(
		action: { print("호호") }){
	Text("하하")
}, trailing : 
	NavigationLink(destination : Text("다음 화면")){
		Image(systemName : "bookmark.fill")
			.font(.system(size:25))
			.foregroundColor(.green)
})
```
#### .leading(왼쪽)
![](https://images.velog.io/images/jewelrykim/post/29dcebbd-1e1d-40cc-8f13-eaf2ef129516/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-16%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%209.14.55.png)

#### .trailing(오른쪽)
![](https://images.velog.io/images/jewelrykim/post/4f6572cd-3df6-49ba-b044-da169ea18b4a/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-16%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%209.15.25.png)


## 12 . GeometryReader
기기 기종에 따라 다른 화면 크기에 비율로 일정한 모습의 뷰를 그릴 수 있는 방법
### Usage
```swift
var body : some View {
	GeometryReader { geometryReader in // 변수명
		Text("1")
			.frame(width : geometryReader.size.width / 3)
	}//GeometryReader
}//body
```
### Enum
```swift
enum Index {
	case one, two, three
}
```
### Button
```swift
@State var index : Index = .one

Button(action : {
	withAnimation{
		self.index = .one
	}
}){
	Text("1")
		.padding(.horizontal, self.index == .one ? 50 : 0)
}
```

## 13 . TabView
바텀 네비게이션 바
```swift
TabView{
// 보여질 화면
	Text("1번")
		.tabItem {
			Image(systemName: "airplane")
			Text("1번")
		}
		.tag(0)
	Text("2번")
		.tabItem {
			Image(systemName: "flame.fill")
			Text("2번")
		}
		.tag(1)
	Text("3번")
		.tabItem {
			Image(systemName: "doc.fill")
			Text("3번")
		}
		.tag(2)
}
```
![](https://images.velog.io/images/jewelrykim/post/52fe36a5-5e63-4bf2-bf06-addf9f539c5f/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-05-20%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2011.02.52.png)
