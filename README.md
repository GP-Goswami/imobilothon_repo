Smart Contract for OEM and Companies - Material Quality Assurance System
This project is a comprehensive solution integrating Smart Contracts, Machine Learning, AI Models, and API Backends to ensure the quality of materials supplied by OEMs to companies. The system focuses on assessing material composition, detecting defects, and validating prices through blockchain for enhanced transparency and accountability.

Project Overview
1. Solidity Smart Contract
A Solidity smart contract facilitates secure and decentralized interactions between OEMs and companies. Key features include:

Material Quality Verification: Validate material hardness, composition, and other properties.
Defect Detection: Ensure supplied materials are free from cracks, breaks, and other flaws.
Price Validation: Cross-check material prices to ensure compliance with predefined thresholds.
The smart contract acts as a digital agreement to streamline transactions and ensure trust between the parties.

2. Material Hardness Prediction Model
A Machine Learning Random Forest Model is used to predict the hardness of materials based on their composition.

Input: Material composition data.
Output: Predicted hardness value.
Dataset: tempering_data.csv, a dataset containing material composition and hardness data.
Usage: Enables quality checks by predicting hardness values as per OEM standards.
A Node.js backend API is integrated with the ML model to provide real-time predictions.

3. AI Car Defection Model
A Deep Learning AI Model analyzes car parts for defects such as:

Cracks
Breaks
Scratches
Paint Defects
Input Dataset: The dataset is stored in the defects folder, containing labeled images for training and testing.

Output: The model identifies whether the part is Defective or Non-Defective, along with the type of defect if applicable.

Workflow and Architecture
Material Quality Check:

OEM provides material composition and sends it to the ML model via the backend API.
The Random Forest Model predicts material hardness based on the input composition.
The smart contract validates the predicted hardness against thresholds defined for each material.
Defect Detection:

Car parts are inspected using the AI Defection Model, which classifies images as Defective or Non-Defective.
If defective, the system flags the material and provides details of the detected defect.
Smart Contract Verification:

The smart contract records transactions, including material details, quality checks, and agreed prices, on the blockchain.
Key Components
Smart Contract: smartcont.sol - Implements the blockchain logic for material quality and pricing validation.
Random Forest ML Model: Predicts material hardness based on tempering_data.csv.
AI Car Defection Model: Classifies defects using labeled image datasets in the defects folder.
Node.js API: Serves as the backend for hardness prediction and defect classification.
File Structure
├── smartcont.sol 
├── ML_Model 
│   ├── tempering_data.csv
│   └── random_forest_model.py
├── AI_Car_Defection_Model
│   ├── defects 
│   └── ai_defect_model.py
├── Backend 
│   ├── app.js 
│   └── routes

How to Use
Deploy Smart Contract:
Deploy the smartcont.sol file on a blockchain network (e.g., Ethereum or Binance Smart Chain).

Train and Test Models:


Train the Random Forest ML Model using the tempering_data.csv dataset.
Train the AI Car Defection Model using the labeled image dataset in the defects folder.
Integrate Backend:

Set up the Node.js API to connect the smart contract with the models.
Use the API endpoints for real-time predictions.
Validate Materials:

Provide input data for quality and defect checks.
Verify results via the smart contract on the blockchain.
Future Enhancements
Add support for additional material properties, such as elasticity and thermal resistance.
Integrate IoT sensors for real-time data collection from manufacturing units.
Expand defect detection capabilities with more defect classes and higher resolution images.
