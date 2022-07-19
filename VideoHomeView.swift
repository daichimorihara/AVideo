//
//  VideoHomeView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/18.
//

import SwiftUI

struct VideoHomeView: View {
    @StateObject var vm = VideoHomeViewModel()
    @State private var showVideo = false
    @State private var selectedVideo: Video?
    
    let columns = [GridItem(.adaptive(minimum: 160), spacing: 20) ]
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $showVideo,
                           destination: { VideoLoadingView(video: $selectedVideo) },
                           label: { EmptyView() })
            
            HStack {
                ForEach(Query.allCases, id: \.self) { query in
                    QueryTag(query: query, isSelected: vm.selectedQuery == query)
                        .onTapGesture {
                            vm.selectedQuery = query
                        }
                }
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.videos) { video in
                        VideoCard(video: video)
                            .onTapGesture {
                                selectedVideo = video
                                showVideo.toggle()
                            }
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct VideoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoHomeView()
    }
}
