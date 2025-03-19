# Blockchain-Based Rental Agreement Smart Contract

## 📌 Overview

This smart contract provides a **decentralized and secure rental agreement** between landlords and tenants. It ensures **automated rent payments, deposit handling, and eviction enforcement** without intermediaries.

## 🎯 Why This Contract?

Traditional rental agreements rely on **third-party enforcement**, which can lead to **disputes, late payments, and trust issues**. This blockchain-based rental contract:

- Eliminates the need for intermediaries (lawyers, property managers).
- Automates **rent payments** and **eviction processes**.
- Ensures **security deposits are safely stored** and refunded fairly.
- Provides **transparent and immutable** lease terms on the blockchain.

## 🛠️ Features

✅ **Landlord can list a rental property** with deposit & rent details.  
✅ **Tenant can rent the property** by paying the deposit & first month's rent.  
✅ **Automated rent payments** every month.  
✅ **Grace period for late payments** before eviction.  
✅ **Security deposit is refunded** when the lease ends or upon eviction.  
✅ **Landlord can withdraw rent** collected from tenants.

---

## ⚙️ Smart Contract Breakdown

### **1️⃣ Contract Variables**

- `landlord`: Address of the landlord (contract owner).
- `tenant`: Address of the tenant who rents the property.
- `rentAmount`: Monthly rent amount in ETH.
- `securityDeposit`: Refundable deposit paid by the tenant.
- `leaseEnd`: Timestamp when the lease ends.
- `lastPaid`: Timestamp of the last rent payment.
- `gracePeriod`: Extra **7-day period** before eviction.
- `status`: Can be **Vacant** or **Occupied**.

### **2️⃣ Functions**

#### 🏠 `constructor(uint256 _rentAmount, uint256 _securityDeposit, uint256 _leaseDuration)`

Initializes the rental contract with:

- **Monthly rent amount**
- **Security deposit amount**
- **Lease duration** in seconds

#### 🏡 `rent()`

- **Tenant calls this function** to rent the property.
- **Pays rentAmount + securityDeposit** in ETH.
- **Marks property as "Occupied"**.

#### 💰 `payRent()`

- **Tenant calls this function** to pay rent.
- **Verifies lease status** and **rent amount**.
- **Updates lastPaid timestamp** for rent tracking.

#### 🚪 `evict()`

- **Landlord can evict** tenant if rent is unpaid **for more than 30 days + 7-day grace period**.
- **Security deposit is refunded** to the tenant.
- **Property is marked "Vacant"** again.

#### 🏦 `withdrawRent()`

- **Landlord can withdraw rent funds** collected in the contract.
- Transfers **contract balance to the landlord**.

---

## 📌 Deployment Guide

### **1️⃣ Compile & Deploy with Remix**

1. Go to [Remix Ethereum IDE](https://remix.ethereum.org/).
2. Create a new file and paste the contract code.
3. Select **Solidity Compiler** → Compile the contract.
4. Go to **Deploy & Run Transactions**.
5. Select an **Injected Web3 environment** (e.g., MetaMask).
6. Deploy by entering:
   - `rentAmount` (in Wei)
   - `securityDeposit` (in Wei)
   - `leaseDuration` (e.g., 1 year = `31536000` seconds)
7. Click **Deploy** and confirm in MetaMask.

### **2️⃣ Interacting with the Contract**

- **Call `rent()`** → Tenant rents the property.
- **Call `payRent()`** → Tenant pays monthly rent.
- **Call `evict()`** → Landlord evicts the tenant if rent is overdue.
- **Call `withdrawRent()`** → Landlord withdraws rent funds.

---

## 🔐 Security Considerations

- The contract **only allows the landlord** to evict tenants.
- **Funds stay locked** in the contract until withdrawn by the landlord.
- **Tenant cannot rent twice** to prevent overpaying.

---

## 🏗️ Future Improvements

🔹 Support for **multiple rental properties** in one contract.  
🔹 Integration with **ERC-20 tokens** for payment instead of ETH.  
🔹 **Dispute resolution mechanism** for fair arbitration.

---

## 💡 Conclusion

This **blockchain-based rental agreement** ensures **fair, automated, and trustless** rental management. It simplifies **rent collection, deposit handling, and eviction**, making it a **powerful tool for landlords and tenants.** 🏠💰

---

## 📜 License

This project is licensed under the **MIT License** – you are free to use, modify, and distribute it as long as proper credit is given.
