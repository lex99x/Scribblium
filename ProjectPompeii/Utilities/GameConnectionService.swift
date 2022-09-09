//
//  GameConnectionManager.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import Foundation
import MultipeerConnectivity

struct Device {
    
    var id: String
    var peerId: MCPeerID
    
}

class GameConnectionService: NSObject, ObservableObject {
    
    private static let service = "pompeii-service"
    
    private let session: MCSession
    
    private let device = Device(
        id: UIDevice.current.identifierForVendor!.uuidString,
        peerId: MCPeerID(displayName: UIDevice.current.name)
    )
    
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    private var nearbyServiceBrowser: MCNearbyServiceBrowser
    
    @Published var devices: [Device] = []
    @Published var devicesPeerIds: [MCPeerID] = []
    
//    private let invitationReceivedHandler: InvitationReceivedHandler?
    
    override init() {
        
        self.session = MCSession(
            peer: device.peerId,
            securityIdentity: nil,
            encryptionPreference: .none)
        
        self.nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
            peer: device.peerId,
            discoveryInfo: nil,
            serviceType: GameConnectionService.service)
        
        self.nearbyServiceBrowser = MCNearbyServiceBrowser(
            peer: device.peerId,
            serviceType: GameConnectionService.service)
        
        super.init()
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceBrowser.delegate = self
        
    }
    
    func getDeviceId() -> String {
        return device.id
    }
    
    func getDeviceName() -> String {
        return device.peerId.displayName
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
    
    func connectWithDeviceId(deviceId: String) {
        
        print(devicesPeerIds)
        
        for device in devices {
            if device.id == deviceId {
                nearbyServiceBrowser.invitePeer(
                    device.peerId,
                    to: session,
                    withContext: nil,
                    timeout: TimeInterval(15)
                )
                break
            }
        }
        
    }

}

extension GameConnectionService: MCNearbyServiceAdvertiserDelegate {

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didReceiveInvitationFromPeer peerID: MCPeerID,
                    withContext context: Data?,
                    invitationHandler: @escaping (Bool, MCSession?) -> Void) {

        invitationHandler(true, self.session)

    }

}

extension GameConnectionService: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        
        if !devicesPeerIds.contains(peerID) {
            print("Found: " + peerID.displayName)
            devicesPeerIds.append(peerID)
        }
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        
        guard let playerIndex = devicesPeerIds.firstIndex(of: peerID) else { return }
        devicesPeerIds.remove(at: playerIndex)
        
    }

}
