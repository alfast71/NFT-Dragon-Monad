# NFT Dragon on Monad Testnet

Questo repository contiene il codice di uno smart contract ERC721 per un NFT che raffigura un drago, creato a scopo di test sulla testnet di Monad.

## Descrizione del Progetto

Questo è un semplice progetto di sviluppo per interagire con l'ambiente di test di Monad. Lo smart contract permette di:
- Creare una collezione di NFT con nome "Dragon Collection" (DRGN).
- Coniare (mint) nuovi token in modo sicuro, assegnando un ID progressivo.
- Associare a ogni token i metadati (nome, descrizione, immagine) ospitati su IPFS.

## Contratto Smart

- **File:** `MyDragonNFT.sol`
- **Linguaggio:** Solidity `^0.8.0`
- **Standard:** ERC721
- **Librerie Utilizzate:** OpenZeppelin (`ERC721`, `Counters`, `Ownable`)

## Come Utilizzarlo

1.  **Configurazione**: Aggiungere la testnet di Monad al proprio wallet (es. MetaMask).
2.  **Deploy**: Compilare e distribuire il contratto `MyDragonNFT.sol` sulla testnet.
3.  **Mint**: Chiamare la funzione `safeMint(address to)` dal proprietario del contratto per creare un nuovo NFT.
