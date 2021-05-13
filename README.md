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

