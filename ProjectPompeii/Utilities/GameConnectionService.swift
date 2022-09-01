//
//  GameConnectionManager.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import Foundation
import MultipeerConnectivity

class GameConnectionService: NSObject, ObservableObject {
    
    private static let service = "pompeii-game-connection-service"
    
    private let session: MCSession
    private let devicePeerId = MCPeerID(displayName: UIDevice.current.name)
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    private var nearbyServiceBrowser: MCNearbyServiceBrowser
    
    @Published var devices: [MCPeerID] = []
    
//    private let invitationReceivedHandler: InvitationReceivedHandler?
    
    override init() {
        
        self.session = MCSession(
            peer: self.devicePeerId,
            securityIdentity: nil,
            encryptionPreference: .none)
        
        self.nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
            peer: devicePeerId,
            discoveryInfo: nil,
            serviceType: GameConnectionService.service)
        
        self.nearbyServiceBrowser = MCNearbyServiceBrowser(
            peer: self.devicePeerId,
            serviceType: GameConnectionService.service)
        
        super.init()
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceBrowser.delegate = self
        
    }
    
    func startAdvertising() {
        nearbyServiceAdvertiser.startAdvertisingPeer()
        print("Started advertising player device!")
    }
    
    func stopAdvertising() {
        nearbyServiceAdvertiser.stopAdvertisingPeer()
        print("Stopped advertising player device!")
    }
    
    func startBrowsing() {
        nearbyServiceBrowser.startBrowsingForPeers()
        print("Started browsing for players devices!")
    }
    
    func stopBrowsing() {
        nearbyServiceBrowser.stopBrowsingForPeers()
        print("Started browsing for players devices!")
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
        
        if !devices.contains(peerID) {
            devices.append(peerID)
        }
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        
        guard let playerIndex = devices.firstIndex(of: peerID) else { return }
        devices.remove(at: playerIndex)
        
    }

}
