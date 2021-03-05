
import SwiftUI

struct state: View {
    // @Stateをつける事によってState構造体に管理され、値の更新時と同時に関連するViewも更新する これを状態変数と呼ぶ
    // @Stateで宣言されたプロパティはそれを保持するViewと、そのプロパティを参照する配下のViewからしかアクセスできないため、Appleはprivateを推奨している
    // 外から初期値を代入できないので、プロパティは初期値が必要！
    @State private var showDetails = false //プロパティラッパーはローカル変数に対応していない
    
    var body: some View {
        //期待通りには動かないコード
//        var showDetails = false
//
//        VStack {
//            Button(action: { showDetails.toggle() }, label: {
//                Text("詳細表示")
//            })
//            if showDetails {
//                Text("詳しくはWebで！")
//                    .font(.largeTitle)
//                    .lineLimit(nil)
//            }
//        }
        
        //期待通りに動くコード
        VStack {
            Button(action: { self.showDetails.toggle() }, label: {
                Text("詳細表示")
            })
            if showDetails {
                Text("詳しくはWebで！")
                    .font(.largeTitle)
                    .lineLimit(nil)
            }
        }
    }
}

struct state_Previews: PreviewProvider {
    static var previews: some View {
        state()
    }
}
