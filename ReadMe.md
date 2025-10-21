# Strategis Insurance - Business Central Integration

## Project Overview

This AL project implements a comprehensive insurance management system for Strategis Insurance, integrating their existing CLAPi system with Microsoft Dynamics 365 Business Central. The solution covers the complete insurance workflow from underwriting to claims management and reinsurance.

## Business Context

Based on extensive requirements gathering sessions with Strategis Insurance, this project addresses their need to streamline operations by integrating CLAPi (their core insurance system) with Business Central for financial management and reporting.

### Key Meeting Insights
- **Meeting 01**: Underwriting process understanding and CLAPi system workflow
- **Meeting 02**: Claims management process and financial integration
- **Meeting 03**: Reinsurance module integration and financial mapping
- **Meeting 04**: Business Central deployment options review
- **Meeting 05**: Chart of Accounts categorization and financial structure
- **Meeting 06**: Final integration architecture and subledger design

## Solution Architecture

### Core Tables

#### 1. Premium Management
- **Tab50300.STIPremiumInvoHeader.al** - Premium invoice header table
- **Tab50301.STIPremiumInvLine.al** - Premium product lines table
- **Tab50304.STIPremiumAgentLine.al** - Agent/Broker commission lines

#### 2. Partner Management
- **Tab50303.STIAgentBrokerMaster.al** - Agent and Broker master data
- **Tab50305.STIReinsurancePartnerMaster.al** - Reinsurance partner master data
- **Tab50306.STIPremiumReinsinurance.al** - Reinsurance participation lines

### User Interface Pages

#### Master Data Management
- **Pag50300.STIAgentBrokerCard.al** - Agent/Broker master card
- **Pag50301.STIAgentBrokerList.al** - Agent/Broker list page
- **Pag50302.STIReinsurancePartnersList.al** - Reinsurance partners list
- **Pag50303.STIReinsurancePartnerCard.al** - Reinsurance partner card

#### Premium Invoice Management
- **Pag50304.STIPremiumInvoiceDocument.al** - Premium invoice document page
- **Pag50305.STIPremiumLinesSubpage.al** - Product lines subpage
- **Pag50306.STIPremiumAgentBrokerSubpa.al** - Agent/Broker lines subpage
- **Pag50307.STIReinsuranceSubpage.al** - Reinsurance lines subpage
- **Pag50308.STIPremiumInvoicesList.al** - Premium invoices list

### Integration Extensions

#### Setup Extensions
- **Tab-Ext50300.STIExtPurchPaySetable.al** - Purchases & Payables Setup extension
- **Tab-Ext50301.STIExtSalRecSetable.al** - Sales & Receivables Setup extension
- **Tab-Ext50302.STIExtVendors.al** - Vendor table extension

#### Page Extensions
- **Pag-Ext50300.STIExtPuchPayablePg.al** - Purchases & Payables Setup page extension
- **Pag-Ext50301.STIExtSalRecPg.al** - Sales & Receivables Setup page extension
- **Pag-Ext50302.STIExtBussRoleCentPg.al** - Business Role Center page extension

### Enums
- **Enum50300.STIStatusenum.al** - Status enumeration for premium invoices

## Key Features

### 1. Complete Underwriting Workflow
- Corporate client creation with KYC details
- Application (Quote) initiation from proposals
- Contract type assignment
- Channel partner commission management
- Product creation and rate setup
- Member list upload and verification
- Application approval process

### 2. Financial Integration
- Invoice generation against approved applications
- Tally system integration for financial recording
- Receipt creation and premium enforcement
- Automated bank reconciliation
- Subledger management for stakeholders

### 3. Reinsurance Management
- Treaty and facultative reinsurance support
- Proportional and non-proportional treaty types
- Multiple reinsurer participation
- Commission and participation calculations
- Catastrophe management setup

### 4. Claims Integration
- Multi-channel claims submission (physical, portal, email)
- Batch claims processing
- Provider payment remittance
- Guarantee of Payment (GOP) handling
- Debit note issuance

## Technical Specifications

### Number Series
- STI Premium Invoice Numbers
- STI Agent/Broker Numbers  
- STI Reinsurance Partner Numbers

### Status Management
- Open, Pending Approval, Approved, Rejected statuses
- Integration status tracking
- Enforcement status for financial posting

### Integration Points
- CLAPi reference mapping for all entities
- Vendor linkage for payment processing
- Bank account integration for reconciliation
- Currency and multi-company support

## Setup Instructions

### 1. Number Series Configuration
Add the following number series to your setup:
- STI Premium Invoice Nos.
- STI Agent/Broker Nos.
- STI Reinsurance Partner Nos.

### 2. Page Customization
The solution extends standard Business Central pages:
- Purchases & Payables Setup
- Sales & Receivables Setup  
- Business Role Center
- Vendor table

### 3. Integration Setup
Configure CLAPi integration parameters:
- API endpoints
- Authentication credentials
- Data mapping rules

## API Integration

The solution supports REST API integration with CLAPi system using OData web services:
- Premium invoice creation and updates
- Real-time data synchronization
- Batch processing support
- Comprehensive error logging

## Business Benefits

1. **Streamlined Operations**: Automated data flow between CLAPi and Business Central
2. **Improved Financial Control**: Real-time financial integration and reporting
3. **Enhanced Partner Management**: Comprehensive agent, broker, and reinsurer tracking
4. **Better Decision Making**: Integrated data for underwriting and claims analysis
5. **Regulatory Compliance**: Complete audit trail and documentation

## Development Standards

- AL best practices compliance
- Comprehensive error handling
- Multi-language support ready
- Performance optimized queries
- Security role integration

## Future Enhancements

1. Advanced reporting and analytics
2. AI-powered risk assessment
3. Blockchain integration for reinsurance
4. Predictive analytics for claims

## Support and Maintenance

For technical support or customization requests, please contact the development team or refer to the technical documentation.

---
 ## File Structure
 
```
 C:.
├───Codeunits
├───Enums
│       Enum50300.STIStatusenum.al
│
├───Layouts
├───Pages
│       Pag50300.STIAgentBrokerCard.al
│       Pag50301.STIAgentBrokerList.al
│       Pag50302.STIReinsurancePartnersList.al
│       Pag50303.STIReinsurancePartnerCard.al
│       Pag50304.STIPremiumInvoiceDocument.al
│       Pag50305.STIPremiumLinesSubpage.al
│       Pag50306.STIPremiumAgentBrokerSubpa.al
│       Pag50307.STIReinsuranceSubpage.al
│       Pag50308.STIPremiumInvoicesList.al
│
├───PagesExt
│       Pag-Ext50300.STIExtPuchPayablePg.al
│       Pag-Ext50301.STIExtSalRecPg.al
│       Pag-Ext50302.STIExtBussRoleCentPg.al
│
├───Reports
├───ReportsExt
├───Tables
│       Tab50300.STIPremiumInvoHeader.al
│       Tab50301.STIPremiumInvLine.al
│       Tab50303.STIAgentBrokerMaster.al
│       Tab50304.STIPremiumAgentLine.al
│       Tab50305.STIReinsurancePartnerMaster.al
│       Tab50306.STIPremiumReinsinurance.al
│
└───TablesExt
        Tab-Ext50300.STIExtPurchPaySetable.al
        Tab-Ext50301.STIExtSalRecSetable.al
        Tab-Ext50302.STIExtVendors.al

```