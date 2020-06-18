//
//  ContentView.swift
//  NewTest
//
//  Created by 莊鎧旭 on 2020/6/9.
//  Copyright © 2020 Cash. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = false
    @State var viewChangedInfo = CGSize.zero
    
    var body: some View {
        ZStack {
            BottomView()
            //
            
            CardView()
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .scaleEffect(0.85)
                .offset(x: show ? 35 : 0, y: show ? -180 : -40)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.easeInOut(duration: 0.7))
                .offset(x: viewChangedInfo.width,y: viewChangedInfo.height)
            CardView()
                .background(Color.red)
                .cornerRadius(20)
                .shadow(radius: 20)
                .scaleEffect(0.95)
                .offset(x: show ? 20 : 0, y: show ? -90 : -20)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.easeInOut(duration: 0.5))
                .offset(x: viewChangedInfo.width,y: viewChangedInfo.height)
            //
            InfoView()
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                .offset(x: viewChangedInfo.width,y: viewChangedInfo.height)
                .onTapGesture {
                    self.show.toggle()
                    
                    
            }
                //拖曳手勢
                .gesture(DragGesture().onChanged({ (view) in
                    self.viewChangedInfo = view.translation
                    self.show = true
                })
                    .onEnded({ (view) in
                        self.viewChangedInfo = CGSize.zero
                        self.show = false
                    }))
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
//設定卡片畫面
struct CardView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {//卡片左上文字內容
                    Spacer()
                    Text("莊鎧旭")
                        .bold()
                        .foregroundColor(Color.white)
                    Text("Ca$h")
                        .bold()
                        .foregroundColor(Color.yellow)
                    Text("iOS Developer")
                        
                        .foregroundColor(Color.white)
                    Text("Producer")
                        
                        .foregroundColor(Color.white)
                }
                Spacer()
                Image("Cash")//右上圖片
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color.clear)
                    .cornerRadius(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                    .shadow(radius: 30)
                    .offset(y:15)
            }
            .padding()
            Text("Phone: 0912-310-398\nE-mail: cash831210@gmail.com")//下方資訊
                .frame(width: 340, height: 100, alignment: .center)
                .background(Color.yellow)
            
        }
        .frame(width: 340, height: 200, alignment: .center)
        
    }
    
}

//設定主要卡片內容畫面
struct InfoView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {//卡片左上文字內容
                    Spacer()
                    Text("莊鎧旭")
                        .bold()
                        .foregroundColor(Color.white)
                    Text("Ca$h")
                        .bold()
                        .foregroundColor(Color.yellow)
                    Text("iOS Developer")
                        
                        .foregroundColor(Color.white)
                    Text("Producer")
                        
                        .foregroundColor(Color.white)
                }
                Spacer()
                Image("Cash")//右上圖片
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color.clear)
                    .cornerRadius(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                    .shadow(radius: 30)
                    .offset(y:15)
            }
            .padding()
            Text("Phone: 0912-310-398\nE-mail: cash831210@gmail.com")//下方資訊
                .frame(width: 340, height: 100, alignment: .center)
                .background(Color.yellow)
            
        }
            
        .frame(width: 340, height: 200, alignment: .center)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
    
}

//設定下方框與文字
struct BottomView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 60, height: 6, alignment: .center)
                .cornerRadius(10)
                .opacity(0.5)
                .padding(0.5)
            Text("您好！歡迎來到Cash的iOS App，\n我是莊鎧旭,你可以叫我Cash,\n喜歡團隊合作、溝通討論,挑戰不同類型專案,接觸新穎的科技,並結合自己的興趣開發App,\n善於使用Swift、 SwiftUI設計應用程式。\n除了工程師以外,同時也是音樂製作人,\n利用Logic Pro X,與手機App製作音樂,編曲,\n錄音,混音,遊戲與動畫配樂&音效設計,\n立志成為結合科技與音樂的程式設計師，\n運用科技的力量帶給人類更便利的生活。")
                .lineLimit(10)
            
            Spacer()
        }
        .padding()
        .padding(.horizontal)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.green)
        .cornerRadius(30)
        .shadow(radius: 30)
        .offset(y: 470)
    }
}
