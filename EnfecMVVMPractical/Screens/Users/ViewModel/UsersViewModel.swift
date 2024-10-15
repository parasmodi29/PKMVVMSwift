//
//  UsersViewModel.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//

import Foundation

class UsersViewModel: NSObject {
    
    private var userService: UsersServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var users = Users()
    
    var userCellViewModels = [UserCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(userService: UsersServiceProtocol = UsersService()) {
        self.userService = userService
    }
    
    func getUsers() {
        userService.getUsers { success, model, error in
            if success, let users = model {
                self.fetchData(users: users)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(users: Users) {
        self.users = users // Cache
        var vms = [UserCellViewModel]()
        for user in users {
            vms.append(createCellModel(user: user))
        }
        userCellViewModels = vms
    }
    
    func createCellModel(user: User) -> UserCellViewModel {
        let id = "ID: " + String(user.id)
        let lat = "Latitude: " + user.address.geo.lat
        let lng = "Longitude: " + user.address.geo.lng
        let companyname = "Company Name: " + user.company.name
        
        return UserCellViewModel(id: id, lat: lat, lng: lng, companyname: companyname)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> UserCellViewModel {
        return userCellViewModels[indexPath.row]
    }
}
