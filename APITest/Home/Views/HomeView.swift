//
//  ContentView.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import SwiftUI
import Combine


struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                if viewModel.isLoadingData {
                   ProgressView("Loading...")
                } else {
                    List(viewModel.posts , id:\.self) { post in
                        NavigationLink {
                            Text("Post details")
                        } label: {
                            ReuseablePostCards(
                                id: post.id,
                                title: post.title,
                                des: post.body
                            )
                        }

                    }
                }
             
            }
        }
        .navigationBarTitle("Home")
        .alert("Error", isPresented: $viewModel.isError) {
            Button("Retry", role: .cancel) {
                   viewModel.fetchPosts()
               }
        } message: {
            Text("something went wrong")
                .font(Font.largeTitle.bold())
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    HomeView()
}
