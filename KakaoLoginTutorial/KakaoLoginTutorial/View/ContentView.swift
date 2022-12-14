//
//  ContentView.swift
//  KakaoLoginTutorial
//
//  Created by Kyungsoo Lee on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM : KakaoAuthViewModel = KakaoAuthViewModel()
    
    let loginStatusInfo: (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
                .padding()
            Button("카카오 로그인", action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            Button("카카오 로그아웃", action: {
                kakaoAuthVM.kakaoLogout()
            })

            Image("\(kakaoAuthVM.testUser?.kakaoAccount?.profile?.thumbnailImageUrl)" ?? "https://k.kakaocdn.net/dn/63PMK/btrKlpA2mj6/TdP3yOIGYh5UGbWklHvcGk/img_640x640.jpg")
            Text("\(kakaoAuthVM.testUser?.kakaoAccount?.profile?.nickname ?? "nickname")")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
