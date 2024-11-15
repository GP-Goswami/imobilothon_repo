// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OEMQualityAssurance {
    address public owner;
    
    struct MaterialData {
        uint256 weight;
        uint256 strength;
        uint256 composition;
        bool qualityVerified;
        bool alertIssued;
    }
    
    mapping(uint256 => MaterialData) public materials;
    
    event QualityIssue(uint256 materialId, string message);
    event QualityVerified(uint256 materialId, string message);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    // Add material data and automatically verify quality
    function addMaterialData(
        uint256 materialId,
        uint256 weight,
        uint256 strength,
        uint256 composition
    ) public onlyOwner {
        materials[materialId] = MaterialData(weight, strength, composition, false, false);
        verifyMaterialQuality(materialId); // Verify quality after adding material
    }

    function verifyMaterialQuality(uint256 materialId) public onlyOwner {
        MaterialData storage material = materials[materialId];
        
        uint256 weightThreshold = 1000;
        uint256 strengthThreshold = 500;
        uint256 compositionThreshold = 75;

        if (
            material.weight >= weightThreshold &&
            material.strength >= strengthThreshold &&
            material.composition >= compositionThreshold
        ) {
            material.qualityVerified = true;
            material.alertIssued = false;
            emit QualityVerified(materialId, "Material meets quality standards.");
        } else {
            material.qualityVerified = false;
            material.alertIssued = true;
            emit QualityIssue(materialId, "Material failed quality check.");
        }
    }

    function issueAlert(uint256 materialId) public view returns (string memory) {
        require(materials[materialId].alertIssued, "No alert for this material.");
        return "Alert: Material does not meet quality standards.";
    }

    function getMaterialData(uint256 materialId) public view returns (
        uint256 weight,
        uint256 strength,
        uint256 composition,
        bool qualityVerified,
        bool alertIssued
    ) {
        MaterialData storage material = materials[materialId];
        return (
            material.weight,
            material.strength,
            material.composition,
            material.qualityVerified,
            material.alertIssued
        );
    }
}
