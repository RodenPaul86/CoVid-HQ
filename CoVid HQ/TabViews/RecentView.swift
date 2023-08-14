//
//  RecentView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct RecentView: View {
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    @State var isSearchVisible = false
    @State private var isShowing = false
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                
                ZStack {
                    VStack {
                        if isSearchVisible {
                            SearchView(searchText: $searchText)
                        }
                        
                        TotalDataView(totalData: covidFetch.totalData)
                        
                        ListHeaderView()
                            .unredacted()
                        
                        List {
                            ForEach(covidFetch.allCountries.filter {
                                self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                            }, id: \.country) { countryData in
                                
                                NavigationLink(destination: CountryDetailView(countryData: countryData)) {
                                    CountryDataRowView(countryData: countryData)
                                }
                                .disabled(isLoading)
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                    }
                    .onAppear { startNetworkCall() }
                    .redacted(reason: isLoading ? .placeholder : [])
                    
                } // End of ZStack
                .background(Color("background"))
                
                .cornerRadius(isShowing ? 20 : 10)
                .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                .scaleEffect(isShowing ? 0.8 : 1)
                
                .navigationBarTitle("CoVid HQ", displayMode: .automatic)
                .toolbar {
                    /*
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            
                            withAnimation(.spring()) {
                                self.isShowing.toggle()
                            }
                            
                        } label: {
                            Label("Settings", systemImage: "list.bullet.indent")
                        }
                    }
                    */
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            
                            self.isSearchVisible.toggle()
                            
                            if !self.isSearchVisible {
                                self.searchText = ""
                            }
                            
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    }
                }
            }
            //.frame(width: UIScreen.main.bounds.width-20, alignment: .center)
            
        } // End of nav bar
        .accentColor(.red)
    }
    
    func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}

