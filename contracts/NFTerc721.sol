// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "erc721a/contracts/ERC721A.sol";

contract NFTerc721 is ERC721A {
    address public owner;

    // Base url for the nfts
    string baseUrl =
        "https://gateway.pinata.cloud/ipfs/QmNWQKZ3T2FerVPgAkDTuNJMTYEDJcMHbEEfJwbEegnNR5";

    //  for the prompt description
    string[] public description ;
    constructor() ERC721A("HumanRace", "HR") {
        owner = msg.sender;
    }

    // Modifier that only allows the owner to execute a function
    modifier ownerAllowed() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }

    function promptUsed()public {
        description.push("Asian man");
        description.push("Indian man");
        description.push("mixed race");
        description.push("Cacaussian man");
        description.push("African man");
    }
    // Function to mint NFT which only owner can perform
    function mint(uint256 quantity) external payable ownerAllowed() {
        require(quantity <= 5,"only 5 nfts to be minted");
            
        _mint(msg.sender, quantity);
    }

    // Override the baseURI function to return the base URL for the NFTs
    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    // Return the URL for the prompt description
    function promptDescription() external view returns (string[] memory) {
        return description;
    }
}
