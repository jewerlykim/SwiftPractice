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

