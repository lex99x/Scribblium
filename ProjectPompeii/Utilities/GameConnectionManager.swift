//
//  GameConnectionManager.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import Foundation
import MultipeerConnectivity
import AVFoundation

struct Device {
    
    var id: String
    var peerId: MCPeerID
    
    static func getCurrentDeviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func getCurrentDeviceName() -> String {
        return UIDevice.current.name
    }
    
}

struct Session {
    
    var mcSession: MCSession
    var hostDevice: Device
    var guestDevices: [Device]
    
}

class GameConnectionManager: NSObject, ObservableObject {
    
    private static let service = "pompeii-service"
    
    private let session: MCSession
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    private var nearbyServiceBrowser: MCNearbyServiceBrowser
    
    private let currentDeviceId = UIDevice.current.identifierForVendor!.uuidString
    private let currentDeviceName = UIDevice.current.name
    private let peerId = MCPeerID(displayName: UIDevice.current.name)
    
    //    var devices: [Device] = []
    @Published var foundDevices: [Device] = []
    
    //    private let invitationReceivedHandler: InvitationReceivedHandler?
    
    override init() {
        
        self.session = MCSession(
            peer: peerId,
            securityIdentity: nil,
            encryptionPreference: .none)
        
        self.nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
            peer: peerId,
            discoveryInfo: ["deviceId": currentDeviceId],
            serviceType: GameConnectionManager.service)
        
        self.nearbyServiceBrowser = MCNearbyServiceBrowser(
            peer: peerId,
            serviceType: GameConnectionManager.service)
        
        super.init()
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceBrowser.delegate = self
        
    }
    
    func startAdvertising() {
        print("Started advertising player device!")
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    
    func stopAdvertising() {
        print("Stopped advertising player device!")
        nearbyServiceAdvertiser.stopAdvertisingPeer()
    }
    
    func startBrowsing() {
        print("Started browsing for players devices!")
        nearbyServiceBrowser.startBrowsingForPeers()
    }
    
    func stopBrowsing() {
        print("Started browsing for players devices!")
        nearbyServiceBrowser.stopBrowsingForPeers()
    }
    
    private func invitePeer(_ peerId: MCPeerID) {
        nearbyServiceBrowser.invitePeer(
            peerId,
            to: session,
            withContext: UIDevice.current.name.data(using: .utf8),
            timeout: TimeInterval(15)
        )
    }
    
    func invitePeerWithDeviceId(deviceId: String) {
        
        for device in foundDevices {

            if device.id == deviceId {
                print("Connecting to " + device.peerId.displayName + "...")
                invitePeer(device.peerId)
                print("Successfully connected to " + device.peerId.displayName + "!")
                return
            }

        }
        
    }
    
}

extension GameConnectionManager: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didReceiveInvitationFromPeer peerID: MCPeerID,
                    withContext context: Data?,
                    invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        invitationHandler(true, self.session)
        
        let guestName = String(data: context!, encoding: .utf8)!
        print(guestName + " joined your lobby!")
        
    }
    
}

extension GameConnectionManager: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        
        let foundDeviceId = info!["deviceId"]!
        
        print("Current Device ID: " + currentDeviceId)
        print("Found: " + peerID.displayName + " | Device ID: " + foundDeviceId)
        
        foundDevices.append(Device(id: foundDeviceId, peerId: peerID))
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        
//        guard let playerIndex = foundDevices.firstIndex(of: peerID) else { return }
//        foundDevices.remove(at: playerIndex)
        
        var index = 0
        
        for device in foundDevices {
            
            if device.peerId == peerID {
                foundDevices.remove(at: index)
                return
            }
            
            index += 1
    
        }
        
    }
    
}
