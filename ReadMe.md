# Strategis Insurance - Business Central Integration

A comprehensive insurance management system integrating CLAPi insurance platform with Microsoft Dynamics 365 Business Central for end-to-end insurance workflow management.

## 📋 Project Overview

This AL solution implements a complete insurance management system for Strategis Insurance, designed to seamlessly integrate their existing CLAPi insurance platform with Microsoft Dynamics 365 Business Central. The system covers the entire insurance workflow from policy underwriting and premium invoicing to reinsurance management and financial integration.

## 🚀 Key Features

- **📝 Premium Invoice Management**: Complete premium invoice processing with multi-level line items
- **📦 Insurance Product Master**: Centralized product catalog with GL account mapping
- **🤝 Agent & Broker Management**: Comprehensive commission tracking and partner management
- **🔄 Reinsurance Integration**: Treaty and facultative reinsurance with partner participation tracking
- **💳 Financial Integration**: Seamless integration with Business Central financial modules
- **🔗 CLAPi System Sync**: Real-time synchronization with CLAPi insurance platform
- **📊 Multi-dimensional Tracking**: Full dimension support for financial reporting
- **✅ Approval Workflows**: Integrated approval processes for premium invoices
- **🏦 Bank Reconciliation**: Automated bank account integration and reconciliation

## 🏗️ Solution Architecture

### AL Objects Structure

```
📦 Strategies_Insurance
│   ReadMe.md
│
├───Enums/
│   ├── Enum50012.STIProductTypeEnum.al
│   └── Enum50013.STIStatusenum.al
│
├───Pages/
│   ├── Pag50008.STIInsuranceInvoicesList.al
│   ├── Pag50009.STIInsuranceAgentBrokerSubpa.al
│   ├── Pag50010.STIInsuranceLinesSubpage.al
│   ├── Pag50013.STIProductList.al
│   ├── Pag50016.STIProductCard.al
│   ├── Pag50017.STIReinsuranceSubpage.al
│   └── Pag50018.STIInsuranceInvoiceDocument.al
│
├───PagesExt/
│   ├── Pag-Ext50006.STIExtPuchPayablePg.al
│   ├── Pag-Ext50007.STIExtBussRoleCentPg.al
│   └── Pag-Ext50015.STIExtInventorySetupPg.al
│
├───Tables/
│   ├── Tab50000.STIInsuranceInvoHeader.al
│   ├── Tab50001.STIInsuranceInvLine.al
│   ├── Tab50002.STIInsuranceAgentLine.al
│   ├── Tab50003.STIInsuranceReinsinurance.al
│   └── Tab50011.STIProductMaster.al
│
└───TablesExt/
    ├── Tab-Ext50004.STIExtVendors.al
    ├── Tab-Ext50005.STIExtPurchPaySetable.al
    └── Tab-Ext50014.STIInventoryExt.al
```

### Core Components

#### Tables
- **STI Insurance Invoice Header**: Main Insurance invoice document management
- **STI Insurance Invoice Line**: Insurance product line items for premiums
- **STI Insurance Agent Line**: Agent and broker commission tracking
- **STI Insurance Reinsurance**: Reinsurance partner participation management
- **STI Product Master**: Central insurance product catalog

#### Pages
- **Insurance Invoice Document**: Comprehensive document page with subpages
- **Product Master**: Insurance product configuration and management
- **List Pages**: Overview pages for invoices and products
- **Subpages**: Line management for products, agents, and reinsurance

#### Extensions
- **Setup Extensions**: Custom configuration for insurance operations
- **Vendor Extensions**: Enhanced vendor management for insurance partners
- **Role Center**: Customized user interface for insurance operations

## 🛠️ Installation & Setup

### Prerequisites
- Microsoft Dynamics 365 Business Central (On-premises or SaaS)
- Visual Studio Code with AL Language extension
- Git version control system

### Installation Steps

1. **Clone the Repository**
   ```bash
   https://github.com/BenStance/Premium_Insurance_Invoice.git
   cd strategis-insurance
   ```

2. **Open in Visual Studio Code**
   ```bash
   code .
   ```

3. **Build and Publish**
   - Configure your `launch.json` with Business Central environment details
   - Build the project (Ctrl+Shift+B)
   - Publish the extension to your Business Central environment

### Configuration

1. **Number Series Setup**
   - Navigate to: **Inventory Setup**
   - Configure "STI Product No." number series

2. **GL Account Mapping**
   - Set up appropriate GL accounts for insurance products
   - Configure premium, commission, and claims accounts

3. **User Permissions**
   - Assign appropriate permissions for insurance operations
   - Configure approval workflows

## 📖 Usage Guide

### Managing Insurance Products

1. **Create New Product**
   - Navigate to "Insurance Products" list
   - Click "New Product" to create insurance product
   - Configure product type, GL accounts, and pricing

2. **Product Configuration**
   - Set premium rates and insurance limits
   - Configure commission rates
   - Define reinsurance requirements
   - Map GL accounts for financial posting

### Premium Invoice Processing

1. **Create Premium Invoice**
   - Open "Premium Invoices" list
   - Create new invoice with customer and policy details
   - Add insurance products with calculated premiums

2. **Manage Commissions**
   - Add agents and brokers with commission percentages
   - System automatically calculates commission amounts
   - Track multiple channel partners per invoice

3. **Reinsurance Allocation**
   - Assign reinsurance partners with participation percentages
   - System calculates participation amounts automatically
   - Track treaty and facultative reinsurance

### Financial Integration

1. **GL Account Posting**
   - Premiums posted to configured GL accounts
   - Commissions posted to expense accounts
   - Reinsurance transactions properly accounted

2. **Vendor Management**
   - Agents, brokers, and reinsurers linked to vendor accounts
   - Automated payment processing
   - Bank reconciliation support

## 🎯 Business Benefits

- **Streamlined Operations**: Automated insurance workflow management
- **Financial Control**: Integrated GL account mapping and posting
- **Partner Management**: Comprehensive agent, broker, and reinsurer tracking
- **Risk Management**: Proper reinsurance allocation and tracking
- **Regulatory Compliance**: Complete audit trail and documentation

## 🔧 Technical Specifications

### Integration Points
- CLAPi reference mapping for all entities
- Vendor linkage for payment processing
- Bank account integration for reconciliation
- Multi-company and multi-currency support

### Security Features
- Role-based access control
- Audit trail tracking
- Data classification and protection
- Approval workflow integration

## 🐛 Troubleshooting

### Common Issues

1. **Number Series Configuration**
   - Ensure "STI Product No." is configured in Inventory Setup
   - Verify number series has available numbers

2. **GL Account Mapping**
   - Confirm GL accounts exist and are properly configured
   - Check account posting groups

3. **Vendor Integration**
   - Verify vendor records exist for partners
   - Check vendor posting setup

### Support Resources

- Check Business Central event log for errors
- Verify user permissions and roles
- Review integration log for CLAPi synchronization issues

## 📞 Support

For technical support and implementation assistance:

- **Development Team**: Athena Core Technologies
- **Contact**: Benedict ACT
- **Phone**: 0622472600
- **Email**: benedict@act-ltd.com

## 🙏 Acknowledgments

### Development Team
- **Athena Core Technologies** - Solution architecture and development
- **Ramesh G** - Lead developer and project coordination
- **Strategis Insurance Team** - Business requirements and testing

### Special Thanks
- Microsoft Dynamics 365 Business Central team
- AL developer community contributors
- Insurance industry experts for domain guidance
- Quality assurance and testing team

---

**Version**: 1.0.0   
**Compatibility**: Business Central 2022 Wave 2 and later  
**License**: Proprietary - Strategis Insurance && Athena Core TRechnologies