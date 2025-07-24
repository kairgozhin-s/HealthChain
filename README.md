# HealthChain — Blockchain-Powered Healthcare Platform

HealthChain is a decentralized application (dApp) that explores the application of blockchain technology in the healthcare industry. It enables **secure prescription management**, **patient-owned data**, and **fine-grained access control** for healthcare professionals — all powered by the Solana blockchain.

---

## Key Features

- **Wallet-based Authentication** using Phantom (Solana)
- **Smart Contract Access Control** (via SPL tokens and cNFTs)
- **Patient-Owned Medical Records** on-chain (encrypted)
- **Dual Storage Architecture**:
  - On-chain (Solana) for sensitive hashes & permissions
  - Off-chain (MySQL + IPFS) for large or non-sensitive data
-  **Role-Based Dashboards** for Patients & Medical Staff
-  **Security Testing** via OWASP ZAP

---

##  Tech Stack

| Layer | Tools/Technologies |
|------|---------------------|
| **Frontend** | React.js, Solana Wallet Adapter, web3.js, Metaplex |
| **Backend** | Node.js, MySQL, IPFS |
| **Blockchain** | Solana, Anchor (Rust) |
| **Auth** | Phantom Wallet |
| **Security Testing** | OWASP ZAP |

---

##  Architecture Overview

- Solana smart contracts check wallet tokens (SPL or compressed NFTs) to determine access levels
- React frontend enables seamless wallet integration and role-based routing
- Hybrid model of on-chain and off-chain data storage allows scalable yet secure operations
- Use of Anchor Framework for writing and deploying Rust-based Solana programs

---

## ⚙️ How to Run

> **Note:** This was developed for Solana **devnet**.

1. Clone the repo
2. Install dependencies:
   ```bash
   npm install
