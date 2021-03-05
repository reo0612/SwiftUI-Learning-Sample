
import SwiftUI

// 状態変更に使用するViews

struct UseStateViews: View {
    
    @State private var isRecoding = false
    @State private var showText = false
    @State private var textFiledText = ""
    @State private var weather = 1
    
    private let micImageNamed = "mic.fill"
    private let micSlashImageNamed = "mic.slash.fill"
    
    var body: some View {
        VStack {
            Button(action: { self.isRecoding.toggle() }) {
                if isRecoding {
                    Image(systemName: micImageNamed)
                        .foregroundColor(.red)
                        .font(.system(size: 200))
                    
                }else {
                    Image(systemName: micSlashImageNamed)
                        .foregroundColor(.gray)
                        .font(.system(size: 200))
                        .offset(x: 1.5, y: 0)
                }
            }
            // トグルのイニシャライザにはisOnがあって今回はshowTextを渡している
            // この時、プロパティの前に$を付けているが、これはswiftUIで状態を管理しているデータshowTextの参照を渡している
            // このように状態変数とViewを関連付けることを「状態変数をViewにバインドする」と表現する
            
            // つまり、isOnに渡す引数がトグルの初期値(false)でもあり、トグルがユーザーによって操作され値が変更された時にはshowTextの値が更新されるという仕組み
            //逆にユーザーの操作によりスイッチが切り替えられると、その内容がshowTextに反映されてshowTextに関連あるViewが自動的に更新される
            Toggle(isOn: $showText, label: {
                Text("テキストを表示する")
                
                if showText {
                    Text("Hello World!!!")
                        .foregroundColor(.red)
                        .italic()
                        .font(.system(size: 24))
                }
            })
            TextField("文字を入力してね！", text: $textFiledText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 境界線を追加する
            Text("こんにちは！\(textFiledText)")
                .padding(.init(top: 15, leading: 0, bottom: 15, trailing: 0))
            Divider()
            Picker(selection: $weather, label: Text("Weather: \(weather)")) {
                Text("晴れ").tag(1)
                Text("曇り").tag(2)
                Text("雨").tag(3)
            }
            Divider()
        }
    }
}

struct UseStateViews_Previews: PreviewProvider {
    static var previews: some View {
        UseStateViews()
    }
}
