
import SwiftUI

// SwiftUIでは様々な値の状態管理をシステムに委譲することができ、そのためのプログラムを書くための構文が「プロパティラッパー」
// Viewのプロパティを監視し、プロパティが変更されたらViewの自動的に作り直す機能がSwiftUIには備わっています
// この機能を使用する場合は、プロパティの前に@stateなどといった属性を付けるのですが、これは「プロパティラッパー」の機能を使って定義される

struct PropertyWrapper: View {
    //@Stateを宣言することで状態管理がStateという構造体のインスタンスに委譲され、このプロパティの値が変更された場合は関連しているViewが自動的に再構築される
    @State var labelText = "Hello World!!!"
    
    var body: some View {
        VStack(spacing: 15) {
            Text(labelText)
                .font(.largeTitle)
                .foregroundColor(.red)
            
            //labelTextプロパティはStateに状態管理されているため、Viewの更新も簡単である
            Button(action: { self.labelText = "Yes! Taped!!" }, label: {
                Text("Tap")
                    .font(.footnote)
                    .frame(width: 150, height: 45, alignment: .center)
                    .foregroundColor(.black)
                    .border(Color.orange, width: 2)
            })
        }
    }
}

struct Property_Wrapper_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapper()
    }
}
