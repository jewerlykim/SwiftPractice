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
