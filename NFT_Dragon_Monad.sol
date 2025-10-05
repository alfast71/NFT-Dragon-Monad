// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyDragonNFT
 * @dev Contratto per la collezione di NFT "Dragon Collection".
 * Solo il proprietario del contratto può coniare nuovi token.
 */
contract MyDragonNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    // !!! PASSO FONDAMENTALE !!!
    // Sostituisci la stringa qui sotto con l'URI del tuo file metadata.json caricato su IPFS.
    // Esempio: "ipfs://bafkreihgkj..."
    string public constant TOKEN_URI = "ipfs://<bafybeidguottctsx5rbhhqfdmrsnzsx66punkvxmupkoeduthb5wc445jq>";

    /**
     * @dev Il costruttore imposta il nome ("Dragon Collection") e il simbolo ("DRGN") della collezione.
     */
    constructor() ERC721("Dragon Collection", "DRGN") Ownable(msg.sender) {}

    /**
     * @dev Funzione sicura per coniare un nuovo NFT e assegnarlo a un indirizzo.
     * Può essere chiamata solo dal proprietario del contratto.
     * @param to L'indirizzo che riceverà il nuovo NFT.
     * @return Il tokenId del nuovo NFT coniato.
     */
    function safeMint(address to) public onlyOwner returns (uint256) {
        // Il contatore parte da 0, quindi il primo ID sarà 1.
        _tokenIdCounter.increment();
        uint256 newItemId = _tokenIdCounter.current();
        _safeMint(to, newItemId);
        return newItemId;
    }

    /**
     * @dev Restituisce l'URI dei metadati. Per questa collezione, tutti i token
     * condividono gli stessi metadati.
     */
    function tokenURI(uint256 /*tokenId*/) public view override returns (string memory) {
        return TOKEN_URI;
    }
}
